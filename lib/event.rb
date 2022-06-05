# class event with type and data attrubutes

class Event
  attr_reader :type, :data

  def initialize(type:, user:, data:)
    @type = type
    @user = user
    @data = data
  end
end