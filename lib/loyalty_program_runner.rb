
require_relative './loyalty_program'
require_relative './user'
require_relative './transaction'
require_relative './amount_spent_point_earning_rule'
require_relative './points_earning_rule_engine'
require_relative './config'
require_relative './reward_rule_engine'
require_relative './monthly_free_coffee_reward_rule'

loyalty_program = LoyaltyProgram.new
user = User.new(name: 'Rohit')
loyalty_program.set_user(user)


point_earning_rule_engine = PointsEarningRuleEngine.new
point_earning_rule_engine.add_rule(AmountSpentPointEarningRule.new)
loyalty_program.add_rule_engine(point_earning_rule_engine)

reward_rule_engine = RewardRuleEngine.new
reward_rule_engine.add_rule(MonthlyFreeCoffeeRewardRule.new)
loyalty_program.add_rule_engine(reward_rule_engine)

transaction1 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')

loyalty_program.add_transaction(transaction1)

puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details


transaction1 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 1000, date: '2022-01-01')

loyalty_program.add_transaction(transaction1)

puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details

transaction1 = Transaction.create_transaction(user: user, currency: Config::USD, amount: 1000, date: '2022-01-01')

loyalty_program.add_transaction(transaction1)

puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details

