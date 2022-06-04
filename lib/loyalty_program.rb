# class loyalty_programm which have multiple users and transaction, config and rule engine
#
class LoyaltyProgram
  USD = 'usd'
  INR = 'inr'
  SGD = 'sgd'

  SUPPORTED_CURRENCY_LIST = [USD, INR, SGD]

  CURRENCY_EXCHANGE_RATES = {
    USD => 1,
    INR => 80,
    SGD => 50
  }
  attr_accessor :users

  def initialize
    @users = []
  end

  def add_user(user)
    @users << user
  end
end
