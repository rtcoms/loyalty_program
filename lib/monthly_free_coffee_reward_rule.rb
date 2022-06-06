require_relative './rule'
require_relative './reward_coffee_event'

class MonthlyFreeCoffeeRewardRule < Rule
  POINTS_REQUIRED_FOR_COFFEE = 100

  def should_apply?(user:, month:)
    (user.points_for_month(month) >= POINTS_REQUIRED_FOR_COFFEE) && !user.has_free_coffee_for_month?(month)
  end

  def apply(user:, month:)
    RewardCoffeeEvent.new(user: user, month: month)
  end
end