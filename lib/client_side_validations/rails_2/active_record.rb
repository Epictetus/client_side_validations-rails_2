module ClientSideValidations::Rails2
  module ActiveRecord; end
end

require 'client_side_validations/rails_2/active_record/active_model'
require 'client_side_validations/rails_2/active_record/validations'

require 'client_side_validations/active_model'

ActiveModel::Validations::BaseValidator.send(:include, ActiveModel::Validator)
ActiveRecord::Base.send(:include, ActiveModel::Validations)
ActiveRecord::Base.send(:extend,  ActiveModel::Validations::ClassMethods)

