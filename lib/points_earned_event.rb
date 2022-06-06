require_relative './event'
require_relative './points_earned_event'

class PointsEarnedEvent < Event
  attr_reader :points, :user

  def initialize(user:, data:)
    @data = data
    @user = user
  end

  def apply(user)
    user.set_points_details(
      { commulative_points: @data[:quantity]}
    )
    user
  end
end