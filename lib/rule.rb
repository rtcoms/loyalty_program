# class Rule

class Rule
  def should_apply?(user:)
    raise 'NOT IMPLEMENTED'
  end

  def apply(user:)
    raise 'NOT IMPLEMENTED'
  end
end