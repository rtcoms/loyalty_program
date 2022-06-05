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
end
