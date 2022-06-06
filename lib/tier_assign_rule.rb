require_relative './rule'
require_relative './assign_tier_event'

class TierAssignRule < Rule
  STANDARD_TIER_POINTS = 0
  GOLD_TIER_POINTS = 1000
  PLATINUM_TIER_POINTS = 5000

  def should_apply?(user:, month:)
    true
  end

  def apply(user:, month: )
    tier = calculated_tier(user)

    if user.tier != tier
      AssignTierEvent.new(user: user, tier: tier)
    end

  end

  private

  def calculated_tier(user)
    return :platinum_tier if user.points_details[:commulative_points] >= 5000
    return :gold_tier if user.points_details[:commulative_points] >= 1000
    :standard_tier
  end
end