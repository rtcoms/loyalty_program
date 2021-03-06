require_relative '../lib/loyalty_program.rb'
require_relative '../lib/user.rb'
require_relative '../lib/transaction.rb'
require_relative '../lib/config.rb'
require_relative '../lib/points_earning_rule_engine.rb'
require_relative '../lib/amount_spent_point_earning_rule.rb'


require 'test/unit'

class LoyaltyProgramTest < Test::Unit::TestCase
  def test_loyalty_program
    loyalty_program = LoyaltyProgram.new
    user = User.new(name: 'Rohit')
    loyalty_program.set_user(user)

    assert_equal(loyalty_program.users.keys.size, 1)
    assert_equal(loyalty_program.users.values.first.name, 'Rohit')
  end

  def test_get_user
    loyalty_program = LoyaltyProgram.new
    user1 = User.new(name: 'Rohit')
    user2 = User.new(name: 'Harry Potter')

    loyalty_program.set_user(user1)
    loyalty_program.set_user(user2)

    assert_equal(loyalty_program.get_user(user1.id).name, 'Rohit')
  end

  def test_add_transaction
    loyalty_program = LoyaltyProgram.new
    user = User.new(name: 'Rohit')
    loyalty_program.set_user(user)

    point_earining_rule_engine = PointsEarningRuleEngine.new
    point_earining_rule_engine.add_rule(AmountSpentPointEarningRule.new)
    loyalty_program.add_rule_engine(point_earining_rule_engine)

    transaction1 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')
    loyalty_program.add_transaction(transaction1)

    assert_equal(loyalty_program.get_user(user.id).transactions.size, 1)
    assert_equal(loyalty_program.get_user(user.id).points_details, { commulative_points: 10, monthwise_points: [{month: '2022-01', points: 10 }]})
  end
end
