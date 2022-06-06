# class loyalty_programm which have multiple users and transaction, config and rule engine
require_relative './points_earning_rule_engine'
require_relative './config'

class LoyaltyProgram
  attr_reader :users, :transactions

  def initialize
    @users = {}
    @transactions = []
    @rule_engines = []
  end

  def set_user(user)
    @users[user.id] = user
  end

  def get_user(id)
    @users[id]
  end

  def add_rule_engine(rule_engine)
    @rule_engines << rule_engine
  end

  def add_transaction(transaction)
    raise 'INVALID USER' if @users[transaction.user.id].nil?

    @transactions << transaction

    @rule_engines.each do |rule_engine|
      events = rule_engine.run(user: transaction.user, monthwise_transactions: monthwise_transactions_for_user(user: transaction.user))

      events.each do |event|
        updated_user = event.apply(get_user(transaction.user.id))
        set_user(updated_user)
      end
    end
  end

  def transactions_for(user:)
    @transactions.select { |t| t.user.id == user.id }
  end

  def monthwise_transactions_for_user(user:)
    transactions_for(user: user).group_by { |t| t.date.strftime('%Y-%m') }
  end
end
