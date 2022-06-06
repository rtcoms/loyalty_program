require_relative './event'

class RewardBirthdayCoffeeEvent < Event
  attr_reader :user

  def initialize(user:, month:)
    @user = user
    @month = month
  end

  def apply(user)
    user.assign_birthday_coffee_reward
    user
  end
end