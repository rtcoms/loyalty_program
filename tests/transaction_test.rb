require_relative '../lib/transaction'
require_relative '../lib/user'
require_relative '../lib/config'
require_relative '../lib/loyalty_program'
require 'test/unit'

class TransactionTest < Test::Unit::TestCase
  def test_transaction
    transaction = Transaction.new(user: User.new(name: 'Doe'), currency: Config::USD, amount: 100, date: '2019-01-01')
    assert_equal(transaction.user.name, 'Doe')
    assert_equal(transaction.currency,  Config::USD)
    assert_equal(transaction.amount, 100)
    assert_equal(transaction.date.to_s, '2019-01-01')
  end

  def test_transaction_validations
    assert_raise(RuntimeError) { Transaction.new(user: User.new(name: 'Doe'), currency:  Config::USD, amount: -100, date: '2019-01-01') }
    assert_raise(RuntimeError) { Transaction.new(user: User.new(name: 'Doe'), currency: 'EURO', amount: 100, date: '2019-01-01') }
    # assert_raise(Date::Error) { Transaction.new(user: User.new(name: 'Doe'), currency: Config::USD, amount: 100, date: '2019-01-45') }
  end

  def test_transaction_create
    transaction = Transaction.create_transaction(user: User.new(name: 'Doe'), currency: Config::USD, amount: 100, date: '2019-01-01')
    assert_equal(transaction.user.name, 'Doe')
    assert_equal(transaction.currency,  Config::USD)
    assert_equal(transaction.amount, 100)
    assert_equal(transaction.date.to_s, '2019-01-01')
  end

  def test_create_transactions_for_user
    user = User.new(name: 'Doe')
    amount = 100
    transactions = Transaction.create_transactions_for_user(user: user, currency: Config::USD, amount: amount, date: '2019-01-01', number_of_transactions: 5)
    assert_equal(transactions.map(&:amount).sum, amount)
    assert_equal(transactions.map(&:user).uniq.count, 1)
    assert_equal(transactions.map(&:currency).uniq.count, 1)

    date = Date.parse('2019-01-01')
    # all transaction dates are for month of date
    assert_equal(transactions.map{|d| date.month }.uniq, [date.month])
  end
end