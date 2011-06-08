require 'active_record/cases/test_base'

class ValidationReflectionTest < ClientSideValidations::ActiveRecordTestBase

  def new_user
    user = Class.new(User)
    yield(user)
    user.new
  end

  def test_presence_validator
    user = new_user do |u|
      u.validates_presence_of :name
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Presence.new(:name)
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :presence, validator.kind
  end

end
