module ClientSideValidations::Rails2::ActiveRecord::Validations
  module ClassMethods
    def _validators
      @_validators ||= Hash.new { |hash, key| hash[key] = [] }
    end
  end

  module InstanceMethods
    def _validators
      self.class._validators
    end
  end
end

require 'client_side_validations/rails_2/active_record/validations/base'

%w{presence}.each do |validator|
  require "client_side_validations/rails_2/active_record/validations/#{validator}"
end

ActiveRecord::Base.send(:extend,  ClientSideValidations::Rails2::ActiveRecord::Validations::ClassMethods)
ActiveRecord::Base.send(:include, ClientSideValidations::Rails2::ActiveRecord::Validations::InstanceMethods)


