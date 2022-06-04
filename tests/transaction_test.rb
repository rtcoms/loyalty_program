require_relative '../lib/transaction'
require_relative '../lib/user'
require 'test/unit'

class TransactionTest < Test::Unit::TestCase
  def test_transaction
    transaction = Transaction.new(user: User.new(name: 'Doe'), currency: 'USD', amount: 100, date: '2019-01-01')
    assert_equal(transaction.user.name, 'Doe')
    assert_equal(transaction.currency, 'USD')
    assert_equal(transaction.amount, 100)
    assert_equal(transaction.date, '2019-01-01')
  end
end