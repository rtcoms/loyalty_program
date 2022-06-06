# class Transaction which have user, currency, amount and date
require_relative './support'
require_relative './config'
require 'date'
require 'active_support/all'

class Transaction

  attr_reader :user, :currency, :amount, :date, :amount_in_usd, :points_multiplier

  def initialize(user:, currency:, amount:, date:)
    raise 'INVALID TRANSACTION CURRENCY' unless Config::SUPPORTED_CURRENCY_LIST.include?(currency)
    raise 'INVALID TRANSACTION AMOUNT' if amount.to_i <= 0

    @user = user
    @currency = currency
    @amount = amount.to_i
    @date = date
    @amount_in_usd = (Config::EXCHANGE_RATES[@currency][Config::USD] * @amount).to_i
    @points_multiplier = @user.native_currency == @currency ? 1 : 2
  end

  def to_h
    {
      user: @user.id,
      currency: @currency,
      amount: @amount,
      date: @date.strftime('%Y-%m-%d'),
      amount_in_usd: @amount_in_usd,
      points_multiplier: @points_multiplier
    }
  end

  def set_points_multiplier(multiplier)
    @points_multiplier = multiplier
    self
  end

  def calculate_points(amount_for_points: , reward_points:)
    (@amount_in_usd / amount_for_points) * reward_points * @points_multiplier
  end

  def self.create_transaction(user:, currency:, amount:, date:)
    Transaction.new(user: user, currency: currency, amount: amount, date: Date.parse(date))
  end

  # create x transactions with total amount equal to amount in give month
  # and date is in given month
  def self.create_transactions_for_user(user:, currency:, amount:, date:, number_of_transactions: )
    amounts_array = amount.to_i.rand_sum(number_of_transactions)

    random_date_for_month = amounts_array.map do |_amount|
      start_date = Date.parse(date).beginning_of_month
      end_date = Date.parse(date).end_of_month

      (start_date..end_date).to_a.sample
    end.sort

    amounts_array.map.with_index do |amount, index|
      create_transaction(user: user, currency: currency, amount: amount, date: random_date_for_month[index].to_s)
    end
  end
end

# random date for current month
