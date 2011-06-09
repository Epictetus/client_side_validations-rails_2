# This is to backport the ActiveModel namespacing to ActiveRecord 2.x

module ActiveModel
  module Validations
  end
end

ActiveRecord::Base.send(:include, ActiveModel::Validations)

require 'client_side_validations/rails_2/active_record/active_model/validations'
