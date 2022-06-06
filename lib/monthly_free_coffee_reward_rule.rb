require_relative './calendar_month_rule'
require_relative './reward_coffee_event'

class MonthlyFreeCoffeeRewardRule < CalendarMonthRule
  POINTS_REQUIRED_FOR_COFFEE = 100

  def should_apply?(user:, month:)
    (user.points_for_month(month) >= POINTS_REQUIRED_FOR_COFFEE) && !user.has_free_coffee_for_month?(month)
  end

  def apply(user:, month:)
    RewardCoffeeEvent.new(user: user, month: month)
  end
end