require_relative '../lib/loyalty_program.rb'
require_relative '../lib/user.rb'
require 'test/unit'

class LoyaltyProgramTest < Test::Unit::TestCase
  def test_loyalty_program
    loyalty_program = LoyaltyProgram.new
    user = User.new(name: 'Rohit')
    loyalty_program.add_user(user)

    assert_equal(loyalty_program.users.size, 1)
    assert_equal(loyalty_program.users[0].name, 'Rohit')
  end
end
