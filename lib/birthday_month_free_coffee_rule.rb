
require_relative './calendar_month_rule'
require_relative './reward_birthday_coffee_event'

#TODO: this requires cleanup at end of every year
class BirthdayMonthFreeCoffeeRule < CalendarMonthRule

  def should_apply?(user:, month:)
    user.is_birthday_month?(month) && !user.has_free_birthday_coffee_for_year?(user.date_of_birth.year.to_s)
  end

  def apply(user:, month:)
    RewardBirthdayCoffeeEvent.new(user: user, month: month)
  end
end