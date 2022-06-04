# class Transaction which have user, currency, amount and date

class Transaction

  attr_accessor :user, :currency, :amount, :date

  def initialize(user:, currency:, amount:, date:)
    @user = user
    @currency = currency
    @amount = amount
    @date = date
  end
end