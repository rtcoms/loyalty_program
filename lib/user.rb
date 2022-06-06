require 'securerandom'
require_relative './config'

class User
  attr_reader :id, :name, :points_details, :transactions, :reward_details, :tier, :native_currency,
              :date_of_birth, :birthday_coffee_reward

  def initialize(name: , date_of_birth: '2022-02-01')
    @id = SecureRandom.uuid
    @name = name
    @transactions = []
    @points_details = { commulative_points: 0, monthwise_points: [] }
    @reward_details = { monthwise_rewards: {} }
    @tier = :standard_tier
    @native_currency = Config::USD
    @date_of_birth = Date.parse(date_of_birth)
    @birthday_coffee_reward = false
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

  def is_birthday_month?(month)
    month == @date_of_birth.strftime('%Y-%m')
  end

  def has_free_birthday_coffee_for_year?(year)
    @birthday_coffee_reward
  end

  def assign_birthday_coffee_reward
    @birthday_coffee_reward = true
    self
  end
end