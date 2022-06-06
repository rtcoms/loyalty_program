require 'securerandom'
require_relative './config'

class User
  attr_reader :id, :name, :points_details, :transactions, :reward_details, :tier, :native_currency

  def initialize(name: )
    @id = SecureRandom.uuid
    @name = name
    @transactions = []
    @points_details = { commulative_points: 0, monthwise_points: [] }
    @reward_details = { monthwise_rewards: {} }
    @tier = :standard_tier
    @native_currency = Config::USD
  end

  def set_points_details(points_details)
    @points_details = points_details
    self
  end

  def add_transaction(transaction)
    @transactions << transaction
    self
  end

  def assign_tier(tier:)
    @tier = tier
    self
  end

  def monthwise_transactions
    @transactions.group_by { |t| t.date.strftime('%Y-%m') }
  end

  def transactions_for_month(month)
    monthwise_transactions[month]
  end

  def points_for_month(month)
    @points_details[:monthwise_points][month] || 0
  end

  def reward_free_coffee_for_month(month)
    if @reward_details[:monthwise_rewards][month].nil?
      @reward_details[:monthwise_rewards][month] = { free_coffee: 1 }
    elsif @reward_details[:monthwise_rewards][month][:free_coffee].nil?
      @reward_details[:monthwise_rewards][month][:free_coffee] = 1
    else
      @reward_details[:monthwise_rewards][month][:free_coffee] += 1
    end
    self
  end

  def has_free_coffee_for_month?(month)
    return false if @reward_details[:monthwise_rewards][month].nil?

    @reward_details[:monthwise_rewards][month][:free_coffee].to_i > 0
  end
end