require_relative '../lib/reward_rule_engine'
require_relative '../lib/transaction'
require_relative '../lib/user'
require_relative '../lib/config'
require_relative '../lib/monthly_free_coffee_reward_rule'
require_relative '../lib/event'
require 'test/unit'


class RewardRuleEngineTest < Test::Unit::TestCase
  def test_add_rule
    rule_engine = RewardRuleEngine.new
    rule_engine.add_rule(MonthlyFreeCoffeeRewardRule.new)
    assert_equal(rule_engine.rules.size, 1)
  end

  def test_run
    rule_engine = RewardRuleEngine.new
    rule_engine.add_rule(MonthlyFreeCoffeeRewardRule.new)
    user = User.new(name: 'Rohit')
    transaction1 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')
    transaction2 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 1000, date: '2022-01-01')

    user.add_transaction(transaction1)
    user.set_points_details(points: 100, monthwise_points: [{month: '2022-01', points: 10}])
    events = rule_engine.run(user: user, month: '2022-01')

    assert_equal(events, [])

    user.set_points_details(points: 100, monthwise_points: [{month: '2022-01', points: 100}])
    user.add_transaction(transaction2)
    events = rule_engine.run(user: user, month: '2022-01')

    assert_equal(events.first.class, RewardCoffeeEvent)
    assert_equal(events.first.month, "2022-01")
  end
end

