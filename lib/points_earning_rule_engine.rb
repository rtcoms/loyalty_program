require_relative './rule_engine'
require_relative './amount_spent_point_earning_rule'

class PointsEarningRuleEngine < RuleEngine
  def run(user:)
    @rules.map do |rule|
      next unless rule.should_apply?(user: user)

      rule.apply(user: user)
    end
  end

end
