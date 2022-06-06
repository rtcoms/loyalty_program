require_relative './rule_engine'

class LoyaltyRuleEngine < RuleEngine
  def run(user:, month:)
    @rules.map do |rule|
      next unless rule.should_apply?(user: user, month: month)

      rule.apply(user: user, month: month)
    end.compact
  end

end
