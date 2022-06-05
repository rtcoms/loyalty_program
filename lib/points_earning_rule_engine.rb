# class RewardRuleEngine which have multiple rules
require_relative './amount_spent_point_earning_rule'

class PointsEarningRuleEngine
  attr_reader :rules

  def initialize
    @rules = []
  end

  def add_rule(rule)
    @rules << rule
  end

  def run(user:, transactions:)
    @rules.map do |rule|
      next unless rule.should_apply?(user: user, transactions: transactions)

      rule.apply(user: user, transactions: transactions)
    end
  end

end
