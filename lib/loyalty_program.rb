# class loyalty_programm which have multiple users and transaction, config and rule engine
require_relative './points_earning_rule_engine'
require_relative './config'

class LoyaltyProgram
  attr_reader :users, :transactions

  def initialize
    @users = {}
    @transactions = []
  end

  def set_user(user)
    @users[user.id] = user
  end

  def add_transaction(transaction)
    raise 'INVALID USER' if @users[transaction.user.id].nil?

    @transactions << transaction
  end

  def transactions_for(user:)
    @transactions.select { |t| t.user.id == user.id }
  end
end
