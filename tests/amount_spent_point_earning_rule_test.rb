require_relative '../lib/loyalty_program'
require_relative '../lib/user'
require_relative '../lib/transaction'
require_relative '../lib/amount_spent_point_earning_rule'
require_relative '../lib/event'
require 'test/unit'

class AmountSpentPointEarningRuleTest < Test::Unit::TestCase
  def test_should_apply_true
    rule = AmountSpentPointEarningRule.new
    user = User.new(name: 'Rohit')
    assert_equal(rule.should_apply?(user: user), true)
  end

  def test_apply
    rule = AmountSpentPointEarningRule.new
    user = User.new(name: 'Rohit')
    transaction1 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')
    transaction2 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')

    user.add_transaction(transaction1)
    user.add_transaction(transaction2)
    assert_equal(rule.apply(user: user).data[:quantity], 20)
  end
end
