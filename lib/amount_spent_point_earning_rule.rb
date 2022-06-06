# class AmountSpentPointEarningRule which give 10 points per 100 usd spent
require_relative './rule'
require_relative './points_earned_event'

class AmountSpentPointEarningRule < Rule
  AMOUNT_SPENT = 100
  REWARD_POINTS = 10

  def should_apply?(user:, monthwise_transactions:)
    true
  end

  def apply(user: nil, monthwise_transactions: [])
    points_earned = (monthwise_transactions.values.flatten.map(&:amount).sum / AMOUNT_SPENT) * REWARD_POINTS

    monthwise_points = monthwise_transactions.map do |month, transactions|
      { month: month, points: transactions.map(&:amount).sum / AMOUNT_SPENT * REWARD_POINTS }
    end

    puts '============'
    puts monthwise_points

    PointsEarnedEvent.new(user: user, data: { quantity: points_earned, monthwise_points: monthwise_points })
  end
end