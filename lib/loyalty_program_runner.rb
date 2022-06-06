
require_relative './loyalty_program'
require_relative './user'
require_relative './transaction'
require_relative './amount_spent_point_earning_rule'
require_relative './points_earning_rule_engine'
require_relative './config'
require_relative './reward_rule_engine'
require_relative './monthly_free_coffee_reward_rule'
require_relative './loyalty_rule_engine'
require_relative './tier_assign_rule'
require_relative './birthday_month_free_coffee_rule'

loyalty_program = LoyaltyProgram.new
user = User.new(name: 'Rohit', date_of_birth: '2022-02-02')
loyalty_program.set_user(user)


point_earning_rule_engine = PointsEarningRuleEngine.new
point_earning_rule_engine.add_rule(AmountSpentPointEarningRule.new)
loyalty_program.add_rule_engine(point_earning_rule_engine)

reward_rule_engine = RewardRuleEngine.new
reward_rule_engine.add_rule(MonthlyFreeCoffeeRewardRule.new)
reward_rule_engine.add_rule(BirthdayMonthFreeCoffeeRule.new)
loyalty_program.add_rule_engine(reward_rule_engine)

loyalt_rule_engine = LoyaltyRuleEngine.new
loyalt_rule_engine.add_rule(TierAssignRule.new)
loyalty_program.add_rule_engine(loyalt_rule_engine)


transaction = Transaction.create_transaction(user: user, currency: Config::USD, amount: 100, date: '2022-01-01')

loyalty_program.add_transaction(transaction)

puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details
puts "Birthday coffee: #{ loyalty_program.get_user(user.id).birthday_coffee_reward }"


transaction = Transaction.create_transaction(user: user, currency: Config::USD, amount: 1000, date: '2022-02-01')

loyalty_program.add_transaction(transaction)

puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details
puts "Birthday coffee: #{ loyalty_program.get_user(user.id).birthday_coffee_reward }"

transaction = Transaction.create_transaction(user: user, currency: Config::USD, amount: 1000, date: '2022-02-01')

loyalty_program.add_transaction(transaction)

puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details
puts loyalty_program.get_user(user.id).tier
puts "Birthday coffee: #{ loyalty_program.get_user(user.id).birthday_coffee_reward }"


transaction = Transaction.create_transaction(user: user, currency: Config::USD, amount: 10000, date: '2022-02-01')

loyalty_program.add_transaction(transaction)

puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details
puts loyalty_program.get_user(user.id).tier
puts "Birthday coffee: #{ loyalty_program.get_user(user.id).birthday_coffee_reward }"

transaction = Transaction.create_transaction(user: user, currency: Config::SGD, amount: 10000, date: '2022-03-01')

loyalty_program.add_transaction(transaction)

puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details
puts loyalty_program.get_user(user.id).tier
puts "Birthday coffee: #{ loyalty_program.get_user(user.id).birthday_coffee_reward }"




loyalty_program.run_rule_engines_for_month('2022-02')
puts '=================='
puts loyalty_program.get_user(user.id).points_details
puts loyalty_program.get_user(user.id).reward_details
puts loyalty_program.get_user(user.id).tier
puts "Birthday coffee: #{ loyalty_program.get_user(user.id).birthday_coffee_reward }"