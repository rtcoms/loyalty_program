require_relative '../lib/user'
require 'test/unit'

class UserTest < Test::Unit::TestCase
  def test_user
    user = User.new(name: 'Doe')
    assert_equal(user.name, 'Doe')
    assert_equal(user.id.nil?, false)
  end
end