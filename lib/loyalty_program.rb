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

  attr_reader :users, :transactions

  def initialize
    @users = {}
    @transactions = []
    @events = {}
  end

  def set_user(user)
    @users[user.id] = user
  end

  # add transaction
  def create_transaction(user: , currency:, amount: , date: )
    raise 'USER NOT PRESENT IN THE SYSTEM' if @users[user.id].nil?

    @transactions << Transaction.new(user:, currency:, amount:, date:)
  end
end
