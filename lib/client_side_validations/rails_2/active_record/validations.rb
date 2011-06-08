module ClientSideValidations::Rails2::ActiveRecord::Validations
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

require 'client_side_validations/rails_2/active_record/validations/base'

%w{presence}.each do |validator|
  eval <<-MODULE
  module ClientSideValidations::Rails2::ActiveRecord::Validations
    const_set '#{validator.capitalize}', Class.new(Base)

    module ClassMethods
      define_method "validates_#{validator}_of" do |*attr_names|
        options = attr_names.extract_options!
        attr_names.each do |name|
          self._validators[name] << #{validator.capitalize}.new(name, options)
        end

        super(attr_names << options)
      end
    end
  end
  MODULE
end

ActiveRecord::Base.send(:extend,  ClientSideValidations::Rails2::ActiveRecord::Validations::ClassMethods)
ActiveRecord::Base.send(:include, ClientSideValidations::Rails2::ActiveRecord::Validations::InstanceMethods)


