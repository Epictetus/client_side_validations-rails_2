module ActiveModel::Validations
  class BaseValidator
    attr_accessor :attributes, :options

    def initialize(attributes, options = {})
      self.attributes = attributes
      self.options    = options
    end

    def ==(other)
      class_equality     = self.class      == other.class
      attribute_equality = self.attributes == other.attributes
      options_equality   = self.options    == other.options
      class_equality && attribute_equality && options_equality
    end

    def self.kind
      @kind ||= name.split('::').last.underscore.sub(/_validator$/, '').to_sym
    end

    def kind
      self.class.kind
    end
  end
end
