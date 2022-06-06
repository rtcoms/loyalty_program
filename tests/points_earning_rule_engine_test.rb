require_relative '../lib/points_earning_rule_engine'
require_relative '../lib/transaction'
require_relative '../lib/user'
require_relative '../lib/config'
require_relative '../lib/amount_spent_point_earning_rule'
require_relative '../lib/event'

require 'test/unit'

class PointsEarningRuleEngineTest < Test::Unit::TestCase
  def test_add_rule
    rule_engine = PointsEarningRuleEngine.new
    rule_engine.add_rule(AmountSpentPointEarningRule.new)
    assert_equal(rule_engine.rules.size, 1)
  end

  def test_run
    rule_engine = PointsEarningRuleEngine.new
    rule_engine.add_rule(AmountSpentPointEarningRule.new)
    user = User.new(name: 'Rohit')
    transaction1 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')
    transaction2 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')

    user.add_transaction(transaction1)
    user.add_transaction(transaction2)

    events = rule_engine.run(user: user, month: '2022-01')

    assert_equal(events.first.class, PointsEarnedEvent)
    assert_equal(events.first.data, {:quantity=>20, :monthwise_points=>[{:month=>"2022-01", :points=>20}]})
  end
end