require 'active_record/cases/test_base'

class ValidationReflectionTest < ClientSideValidations::ActiveRecordTestBase

  def new_user
    user = Class.new(User)
    def user.name
      'User'
    end
    yield(user)
    user.new
  end

  def test_acceptance_validator
    user = new_user do |u|
      u.validates_acceptance_of :flag
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Acceptance.new(:flag)
    expected = { :flag => [validator] }
    assert_equal expected, user._validators
    assert_equal :acceptance, validator.kind
    user.flag = false
    user.valid?
    assert_equal 'must be accepted', user.errors[:flag]
  end

  def test_confirmation_validator
    user = new_user do |u|
      u.validates_confirmation_of :name
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Confirmation.new(:name)
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :confirmation, validator.kind
    user.name_confirmation = 'Brian'
    user.valid?
    assert_equal "doesn't match confirmation", user.errors[:name]
  end

  def test_exclusion_validator
    user = new_user do |u|
      u.validates_exclusion_of :name, :in => ['Brian']
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Exclusion.new(:name, :in => ['Brian'])
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :exclusion, validator.kind
    user.name = 'Brian'
    user.valid?
    assert_equal "is reserved", user.errors[:name]
  end

  def test_format_validator
    user = new_user do |u|
      u.validates_format_of :name, :with => /\w+/
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Format.new(:name, :with => /\w+/)
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :format, validator.kind
    user.valid?
    assert_equal "is invalid", user.errors[:name]
  end

  def test_inclusion_validator
    user = new_user do |u|
      u.validates_inclusion_of :name, :in => ['Brian']
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Inclusion.new(:name, :in => ['Brian'])
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :inclusion, validator.kind
    user.name = 'Steph'
    user.valid?
    assert_equal "is not included in the list", user.errors[:name]
  end

  def test_length_validator
    user = new_user do |u|
      u.validates_length_of :name, :is => 10
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Length.new(:name, :is => 10)
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :length, validator.kind
    user.name = 'Brian'
    user.valid?
    assert_equal "is the wrong length (should be 10 characters)", user.errors[:name]
  end

  def test_numericality_validator
    user = new_user do |u|
      u.validates_numericality_of :age
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Numericality.new(:age)
    expected = { :age => [validator] }
    assert_equal expected, user._validators
    assert_equal :numericality, validator.kind
    user.age = 'Brian'
    user.valid?
    assert_equal "is not a number", user.errors[:age]
  end

  def test_presence_validator
    user = new_user do |u|
      u.validates_presence_of :name
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Presence.new(:name)
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :presence, validator.kind
    user.valid?
    assert_equal "can't be blank", user.errors[:name]
  end

  def test_size_validator
    user = new_user do |u|
      u.validates_size_of :name, :is => 10
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Length.new(:name, :is => 10)
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :length, validator.kind
    user.name = 'brian'
    user.valid?
    assert_equal "is the wrong length (should be 10 characters)", user.errors[:name]
  end

  def test_uniqueness_validator
    user = new_user do |u|
      u.validates_uniqueness_of :name
    end
    validator = ClientSideValidations::Rails2::ActiveRecord::Validations::Uniqueness.new(:name)
    expected = { :name => [validator] }
    assert_equal expected, user._validators
    assert_equal :uniqueness, validator.kind
    User.create(:name => 'Brian')
    user.name = 'Brian'
    user.valid?
    assert_equal "has already been taken", user.errors[:name]
    User.destroy_all
  end

end
