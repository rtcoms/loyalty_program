require_relative '../lib/loyalty_program.rb'
require_relative '../lib/user.rb'
require_relative '../lib/transaction.rb'
require_relative '../lib/config.rb'

require 'test/unit'

class LoyaltyProgramTest < Test::Unit::TestCase
  def test_loyalty_program
    loyalty_program = LoyaltyProgram.new
    user = User.new(name: 'Rohit')
    loyalty_program.set_user(user)

    assert_equal(loyalty_program.users.keys.size, 1)
    assert_equal(loyalty_program.users.values.first.name, 'Rohit')
  end
end
