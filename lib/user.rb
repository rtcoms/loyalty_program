require 'securerandom'

class User
  attr_accessor :id, :name, :points_details

  def initialize(name: )
    @id = SecureRandom.uuid
    @name = name
  end

  def set_points_details(points_details)
    @points_details = points_details
  end
end