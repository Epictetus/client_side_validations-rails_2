module ActiveModel::Validations
  module ClassMethods
    def _validators
      @_validators ||= Hash.new { |hash, key| hash[key] = [] }
    end
  end

  def _validators
    self.class._validators
  end
end

require 'client_side_validations/rails_2/active_record/active_model/validations/base'

%w{
  acceptance
  confirmation
  exclusion
  format
  inclusion
  length
  numericality
  presence
}.each do |validator|
  eval <<-MODULE

  module ActiveModel::Validations
    const_set '#{validator.capitalize}Validator', Class.new(BaseValidator)

    module ClassMethods
      define_method "validates_#{validator}_of" do |*attr_names|
        options = attr_names.extract_options!
        attr_names.each do |name|
          self._validators[name] << #{validator.capitalize}Validator.new(name, options)
        end

        super(*((attr_names << options).compact))
      end
    end
  end
  MODULE
end

require 'client_side_validations/rails_2/active_record/active_model/validations/numericality'

module ActiveModel::Validations::ClassMethods
  def validates_size_of(*attr_names)
    validates_length_of(*attr_names)
  end
end

