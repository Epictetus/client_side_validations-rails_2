module ClientSideValidations::Rails2::ActiveRecord::Validations
  const_set 'UniquenessValidator', Class.new(ActiveModel::Validations::BaseValidator)

  module ClassMethods
    def validates_uniqueness_of(*attr_names)
      options = attr_names.extract_options!
      attr_names.each do |name|
        self._validators[name] << UniquenessValidator.new(name, options)
      end

      super(*((attr_names << options).compact))
    end
  end
end

ActiveRecord::Base.send(:extend, ClientSideValidations::Rails2::ActiveRecord::Validations::ClassMethods)

