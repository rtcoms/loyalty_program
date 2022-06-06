require_relative './rule_engine'
require_relative './amount_spent_point_earning_rule'

class PointsEarningRuleEngine < RuleEngine
  def run(user:, month:, trigger_type: :transaction)
    @rules.map do |rule|
      next if trigger_type != rule.rule_trigger_type
      next unless rule.should_apply?(user: user)

      rule.apply(user: user)
    end.compact
  end

end
