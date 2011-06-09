module ActiveModel::Validations
  module ClassMethods
    def _validators
      @_validators ||= Hash.new { |hash, key| hash[key] = [] }
    end
  end

  module InstanceMethods
    def _validators
      self.class._validators
    end
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
        options = options.empty? ? nil : options
        attr_names.each do |name|
          self._validators[name] << #{validator.capitalize}Validator.new(name, options)
        end

        super(*((attr_names << options).compact))
      end
    end
  end
  MODULE
end

module ActiveModel::Validations::ClassMethods
  alias_method :validates_size_of, :validates_length_of
end

ActiveRecord::Base.send(:extend,  ActiveModel::Validations::ClassMethods)
ActiveRecord::Base.send(:include, ActiveModel::Validations::InstanceMethods)

