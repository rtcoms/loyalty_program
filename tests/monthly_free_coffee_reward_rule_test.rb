require_relative '../lib/monthly_free_coffee_reward_rule'
require_relative '../lib/user'
require_relative '../lib/transaction'
require 'test/unit'

class MonthlyFreeCoffeeRewardRuleTest < Test::Unit::TestCase
  def test_should_apply
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 100, monthwise_points: [{ month: '2022-01', points: 100 }] })

    rule = MonthlyFreeCoffeeRewardRule.new
    assert_equal(rule.should_apply?(user: user, month: '2022-01'), true)
  end

  def test_should_not_apply_because_of_points
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 10, monthwise_points: [{ month: '2022-01', points: 10 }] })

    rule = MonthlyFreeCoffeeRewardRule.new
    assert_equal(rule.should_apply?(user: user, month: '2022-01'), false)
  end

  def test_should_not_apply_because_already_rewarded
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 100, monthwise_points: [{ month: '2022-01', points: 100 }] })
    user.reward_free_coffee_for_month('2022-01')
    rule = MonthlyFreeCoffeeRewardRule.new
    assert_equal(rule.should_apply?(user: user, month: '2022-01'), false)
  end


  def test_apply
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 100, monthwise_points: [{month: '2022-01', points: 100}] })

    rule = MonthlyFreeCoffeeRewardRule.new
    event = rule.apply(user: user, month: '2022-01')
    assert_equal(event.class, RewardCoffeeEvent)
  end
end