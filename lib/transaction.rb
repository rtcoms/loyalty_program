# class Transaction which have user, currency, amount and date
require_relative './loyalty_program'
require 'date'

class Transaction

  attr_reader :user, :currency, :amount, :date

  def initialize(user:, currency:, amount:, date:)
    raise 'INVALID TRANSACTION CURRENCY' unless LoyaltyProgram::SUPPORTED_CURRENCY_LIST.include?(currency)
    raise 'INVALID TRANSACTION AMOUNT' if !amount.is_a?(Integer) || amount <= 0

    @user = user
    @currency = currency
    @amount = amount
    @date = Date.parse(date)
  end
end