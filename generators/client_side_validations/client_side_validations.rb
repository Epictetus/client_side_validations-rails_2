class ClientSideValidationsGenerator < Rails::Generator::Base
  def manifest
    record do |c|
      c.file(ClientSideValidations::Files::Initializer, 'config/initializers/client_side_validations.rb')
      c.file(ClientSideValidations::Files::Javascript,  'public/javascripts/rails.validations.js')
    end
  end
end
