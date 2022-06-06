require_relative '../lib/user'
require_relative '../lib/transaction'
require_relative '../lib/config'

require 'test/unit'

class UserTest < Test::Unit::TestCase
  def test_user
    user = User.new(name: 'Doe')
    assert_equal(user.name, 'Doe')
    assert_equal(user.id.nil?, false)
  end

  def test_set_points_details
    user = User.new(name: 'Doe')
    user.set_points_details({ commulative_points: 100 })
    assert_equal(user.points_details, { commulative_points: 100 })
  end

  def test_add_transaction
    user = User.new(name: 'Doe')
    transaction = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')
    user.add_transaction(transaction)
    assert_equal(user.transactions.size, 1)
  end

  def test_monthwise_transactions
    user = User.new(name: 'Doe')
    transaction1 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')
    transaction2 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-02-01')
    transaction3 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-03-01')
    user.add_transaction(transaction1)
    user.add_transaction(transaction2)
    user.add_transaction(transaction3)
    assert_equal(user.monthwise_transactions, { '2022-01' => [transaction1], '2022-02' => [transaction2], '2022-03' => [transaction3] })
  end
end