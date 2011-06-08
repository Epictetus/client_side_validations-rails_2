module ClientSideValidations::Rails2::ActiveRecord::Validations
  module ClassMethods
    def validates_presence_of(*attr_names)
      options = attr_names.extract_options!
      attr_names.each do |name|
        self._validators[name] << ClientSideValidations::Rails2::ActiveRecord::Validations::Presence.new(name, options)
      end

      super(attr_names << options)
    end
  end

  class Presence < Base
  end
end

