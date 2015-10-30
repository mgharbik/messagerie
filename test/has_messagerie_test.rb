require 'test_helper'

class HasMessagerieTest < ActiveSupport::TestCase

  def test_a_user_should_have_conversations
    user = User.create!(email: "user@email.com")
    assert_equal [], user.conversations
  end
end