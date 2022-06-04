require_relative '../lib/loyalty_program.rb'
require_relative '../lib/user.rb'
require_relative '../lib/transaction.rb'
require 'test/unit'

class LoyaltyProgramTest < Test::Unit::TestCase
  def test_loyalty_program
    loyalty_program = LoyaltyProgram.new
    user = User.new(name: 'Rohit')
    loyalty_program.add_user(user)

    assert_equal(loyalty_program.users.size, 1)
    assert_equal(loyalty_program.users[0].name, 'Rohit')
  end

  def test_create_transaction
    loyalty_program = LoyaltyProgram.new
    user = User.new(name: 'Rohit')
    loyalty_program.add_user(user)
    loyalty_program.create_transaction(user: user, currency: LoyaltyProgram::USD, amount: 100, date: '2019-01-01')

    assert_equal(loyalty_program.transactions.size, 1)
    assert_equal(loyalty_program.transactions[0].user.name, 'Rohit')
  end

  def test_create_transaction_validations
    loyalty_program = LoyaltyProgram.new
    user = User.new(name: 'Rohit')

    assert_raise(RuntimeError) { loyalty_program.create_transaction(user: user, currency: LoyaltyProgram::USD, amount: 100, date: '2019-01-01') }
  end
end
