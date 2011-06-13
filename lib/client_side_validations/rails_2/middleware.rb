# encoding: utf-8

require 'client_side_validations/middleware'

module ClientSideValidations

  module Middleware
    class Base
      def initialize(env)
        self.body    = ''
        self.status  = 200
        self.request = ActionController::Request.new(env)
      end
    end
  end
end

if defined?(Rails)
  Rails.configuration.after_initialize do
    Rails.configuration.middleware.use ClientSideValidations::Middleware::Validators
  end
end
