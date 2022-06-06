require_relative './event'

class RewardCoffeeEvent < Event
  attr_reader :user, :month

  def initialize(user:, month:)
    @month = month
    @user = user
  end

  def apply(user)
    user.reward_free_coffee_for_month(@month)
    user
  end
end