# class RewardRuleEngine which have multiple rules
require_relative './rule_engine'
require_relative './amount_spent_point_earning_rule'

class PointsEarningRuleEngine < RuleEngine
  def run(user:, monthwise_transactions:)
    @rules.map do |rule|
      next unless rule.should_apply?(user: user, monthwise_transactions: monthwise_transactions)

      rule.apply(user: user, transactions: monthwise_transactions)
    end
  end

end
