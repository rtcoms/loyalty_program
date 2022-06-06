# class Rule

class Rule
  attr_reader :rule_trigger_type

  def initialize
    @rule_trigger_type = :transaction
  end

  def should_apply?(user:)
    raise 'NOT IMPLEMENTED'
  end

  def apply(user:)
    raise 'NOT IMPLEMENTED'
  end
end