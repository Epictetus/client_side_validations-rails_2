module ClientSideValidations::Rails2::ActionView; end

require 'client_side_validations/action_view'
require 'client_side_validations/rails_2/action_view/form_helper'

ActionView::Base.send(:include, ClientSideValidations::Rails2::ActionView::Helpers::FormHelper)

