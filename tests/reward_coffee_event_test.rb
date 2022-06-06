require_relative '../lib/reward_coffee_event'
require_relative '../lib/user'
require 'test/unit'

class RewardCoffeeEventTest < Test::Unit::TestCase
  def test_reward_coffee_event
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 100, monthwise_points: [] })

    event = RewardCoffeeEvent.new(user: user, month: '2022-01')
    updated_user = event.apply(user)

    assert_equal(updated_user.reward_details, { monthwise_rewards: { '2022-01' => { free_coffee: 1 } } })

    event = RewardCoffeeEvent.new(user: user, month: '2022-01')
    updated_user = event.apply(user)

    assert_equal(updated_user.reward_details, { monthwise_rewards: { '2022-01' => { free_coffee: 2 } } })
  end
end
