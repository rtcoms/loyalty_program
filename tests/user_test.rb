require_relative '../lib/user'
require 'test/unit'

class UserTest < Test::Unit::TestCase
  def test_user
    user = User.new(name: 'Doe')
    assert_equal(user.name, 'Doe')
    assert_equal(user.id.nil?, false)
  end

  def test_set_points_details
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 100 })
    assert_equal(user.points_details, { commulative_points: 100 })
  end
end