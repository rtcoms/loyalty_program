# class Rule

class CalendarMonthRule
  attr_reader :rule_trigger_type

  def initialize
    @rule_trigger_type = :monthly
  end

  def should_apply?(user:, month:)
    raise 'NOT IMPLEMENTED'
  end

  def apply(user:, month:)
    raise 'NOT IMPLEMENTED'
  end
end