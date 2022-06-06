require_relative '../lib/points_earned_event'
require_relative '../lib/user'
require 'test/unit'

class PointsEarnedEventTest < Test::Unit::TestCase
  def test_points_earned_event
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 100 })

    event = PointsEarnedEvent.new(user: user, data: { quantity: 200 })
    updated_user = event.apply(user)

    assert_equal(updated_user.points_details, { commulative_points: 200 })
  end
end