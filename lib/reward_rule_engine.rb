require_relative './rule_engine'

class RewardRuleEngine < RuleEngine
  def run(user:, month:, trigger_type: :transaction)
    @rules.map do |rule|
      next if trigger_type != rule.rule_trigger_type
      next unless rule.should_apply?(user: user, month: month)

      rule.apply(user: user, month: month)
    end.compact
  end

end
