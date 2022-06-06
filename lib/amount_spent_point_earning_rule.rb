# class AmountSpentPointEarningRule which give 10 points per 100 usd spent
require_relative './rule'
require_relative './points_earned_event'

class AmountSpentPointEarningRule < Rule
  AMOUNT_SPENT = 100
  REWARD_POINTS = 10

  def should_apply?(user:, transactions:)
    true
  end

  def apply(user: nil, transactions: [])
    points_earned = (transactions.map(&:amount).sum / AMOUNT_SPENT) * REWARD_POINTS

    PointsEarnedEvent.new(user: user, data: { quantity: points_earned })
  end
end