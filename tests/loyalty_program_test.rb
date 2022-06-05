require_relative '../lib/loyalty_program.rb'
require_relative '../lib/user.rb'
require_relative '../lib/transaction.rb'
require_relative '../lib/config.rb'

require 'test/unit'

class LoyaltyProgramTest < Test::Unit::TestCase
  def test_loyalty_program
    loyalty_program = LoyaltyProgram.new
    user = User.new(name: 'Rohit')
    loyalty_program.set_user(user)

    assert_equal(loyalty_program.users.keys.size, 1)
    assert_equal(loyalty_program.users.values.first.name, 'Rohit')
  end

  def test_tranasctions_for_user
    loyalty_program = LoyaltyProgram.new
    user1 = User.new(name: 'Rohit')
    user2 = User.new(name: 'Harry Potter')

    loyalty_program.set_user(user1)
    loyalty_program.set_user(user2)

    user1_transaction = Transaction.create_transaction(user: user1, currency: Config::USD, amount: 100, date: '2022-01-01')
    loyalty_program.add_transaction(user1_transaction)

    user2_transaction = Transaction.create_transaction(user: user2, currency: Config::USD, amount: 100, date: '2022-01-01')
    loyalty_program.add_transaction(user2_transaction)

    assert_equal(loyalty_program.transactions_for(user: user1).size, 1)
  end
end
