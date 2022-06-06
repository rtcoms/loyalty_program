require_relative '../lib/points_earned_event'
require_relative '../lib/user'
require 'test/unit'

class PointsEarnedEventTest < Test::Unit::TestCase
  def test_points_earned_event
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 100, monthwise_points: [] })

    event = PointsEarnedEvent.new(user: user, data: { quantity: 200, monthwise_points: [{month: '2022-01', points: 10 }] })
    updated_user = event.apply(user)

    assert_equal(updated_user.points_details, { commulative_points: 200, monthwise_points: [{month: '2022-01', points: 10 }] })
  end
end