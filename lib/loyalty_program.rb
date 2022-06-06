# class loyalty_programm which have multiple users and transaction, config and rule engine
require_relative './points_earning_rule_engine'
require_relative './config'
require 'pry'

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
    user = get_user(transaction.user.id)

    raise 'INVALID USER' if user.nil?

    user = user.add_transaction(transaction)
    set_user(user)

    @rule_engines.each do |rule_engine|
      events = rule_engine.run(user: user, month: transaction.date.strftime('%Y-%m'))

      events.each do |event|
        updated_user = event.apply(user)
        set_user(updated_user)
      end
    end
  end
end
