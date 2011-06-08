module ClientSideValidations::Rails2::ActiveRecord::Validations
  class Base
    attr_accessor :attributes, :options

    def initialize(attributes, options = nil)
      self.attributes = attributes
      self.options    = options.blank? ? nil : options
    end

    def ==(other)
      class_equality     = self.class      == other.class
      attribute_equality = self.attributes == other.attributes
      options_equality   = self.options    == other.options
      class_equality && attribute_equality && options_equality
    end
  end
end
