require_relative '../lib/transaction'
require_relative '../lib/user'
require 'test/unit'

class TransactionTest < Test::Unit::TestCase
  def test_transaction
    transaction = Transaction.new(user: User.new(name: 'Doe'), currency: LoyaltyProgram::USD, amount: 100, date: '2019-01-01')
    assert_equal(transaction.user.name, 'Doe')
    assert_equal(transaction.currency,  LoyaltyProgram::USD)
    assert_equal(transaction.amount, 100)
    assert_equal(transaction.date.to_s, '2019-01-01')
  end

  def test_transaction_validations
    assert_raise(RuntimeError) { Transaction.new(user: User.new(name: 'Doe'), currency:  LoyaltyProgram::USD, amount: -100, date: '2019-01-01') }
    assert_raise(RuntimeError) { Transaction.new(user: User.new(name: 'Doe'), currency: 'EURO', amount: 100, date: '2019-01-01') }
    assert_raise(Date::Error) { Transaction.new(user: User.new(name: 'Doe'), currency: LoyaltyProgram::USD, amount: 100, date: '2019-01-45') }
  end
end