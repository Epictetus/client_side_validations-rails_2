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
    expected = { :name => [ClientSideValidations::Rails2::ActiveRecord::Validations::Presence.new(:name)] }
    assert_equal expected, user._validators
  end
end
