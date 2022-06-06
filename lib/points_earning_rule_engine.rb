require_relative './rule_engine'
require_relative './amount_spent_point_earning_rule'

class PointsEarningRuleEngine < RuleEngine
  def run(user:, month:)
    @rules.map do |rule|
      next unless rule.should_apply?(user: user)

      rule.apply(user: user)
    end.compact
  end

end
