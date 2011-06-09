# This is to backport the ActiveModel namespacing to ActiveRecord 2.x

module ActiveModel
  module Validator; end
  module Validations; end
  class Errors
    CALLBACKS_OPTIONS = [:if, :unless, :on, :allow_nil, :allow_blank]
  end
end

require 'client_side_validations/rails_2/active_record/active_model/validations'

