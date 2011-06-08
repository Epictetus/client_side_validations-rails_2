require 'active_record/cases/helper'

class ClientSideValidations::ActiveRecordTestBase < ActiveRecord::TestCase

  def setup
    @user = User.new
  end

end

