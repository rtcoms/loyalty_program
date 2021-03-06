# class AmountSpentPointEarningRule which give 10 points per 100 usd spent
require_relative './rule'
require_relative './points_earned_event'

class AmountSpentPointEarningRule < Rule
  AMOUNT_SPENT = 100
  REWARD_POINTS = 10

  def should_apply?(user:)
    true
  end

  def apply(user:)
    points_earned = user.monthwise_transactions.values.flatten.map{|txn| txn.calculate_points(amount_for_points: AMOUNT_SPENT, reward_points: REWARD_POINTS)}.sum

    monthwise_points_earned = {}
    monthwise_points = user.monthwise_transactions.map do |month, transactions|
      monthwise_points_earned[month] = transactions.map{|txn| txn.calculate_points(amount_for_points: AMOUNT_SPENT, reward_points: REWARD_POINTS) }.sum
    end

    PointsEarnedEvent.new(user: user, data: { quantity: points_earned, monthwise_points: monthwise_points_earned })
  end
end