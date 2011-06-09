require 'active_record/cases/test_base'

class ValidationsTest < ClientSideValidations::ActiveRecordTestBase

  def new_user
    user = Class.new(User)
    def user.name
      'User'
    end
    yield(user)
    user.new
  end

  def test_validations_to_client_side_hash
    user = new_user do |p|
      p.validates_presence_of :name
    end
    expected_hash = {
      :name => {
        :presence => {
          :message => "can't be blank"
        }
      }
    }
    assert_equal expected_hash, user.client_side_validation_hash
  end
end
