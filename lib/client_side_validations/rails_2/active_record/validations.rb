require 'client_side_validations/active_record/uniqueness'

module ActiveRecord::Validations
  class UniquenessValidator < ActiveModel::Validations::BaseValidator
    include ClientSideValidations::ActiveRecord::Uniqueness
  end
end

module ClientSideValidations::Rails2::ActiveRecord::Validations
  module ClassMethods
    def validates_uniqueness_of(*attr_names)
      options = attr_names.extract_options!
      attr_names.each do |name|
        self._validators[name] << ::ActiveRecord::Validations::UniquenessValidator.new(name, options)
      end

      super(*((attr_names << options).compact))
    end
  end
end

ActiveRecord::Base.send(:extend, ClientSideValidations::Rails2::ActiveRecord::Validations::ClassMethods)

