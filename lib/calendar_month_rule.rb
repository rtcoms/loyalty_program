# class Rule

class CalendarMonthRule
  def should_apply?(user:, month:)
    raise 'NOT IMPLEMENTED'
  end

  def apply(user:, month:)
    raise 'NOT IMPLEMENTED'
  end
end