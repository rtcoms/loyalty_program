class RuleEngine
  attr_reader :rules

  def initialize
    @rules = []
  end

  def add_rule(rule)
    @rules << rule
  end

  def run(user:, monthwise_transactions:)
    raise 'NOT IMPLEMENTED'
  end
end
