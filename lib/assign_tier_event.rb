require_relative './event'
require_relative './user'
require_relative './config'

class AssignTierEvent < Event
  attr_reader :tier, :user

  def initialize(user:, tier:)
    raise 'Tier is not valid' unless Config::TIERS_LIST.include?(tier)

    @tier = tier
    @user = user
  end

  def apply(user)
    user.assign_tier(tier: @tier)
    user
  end
end