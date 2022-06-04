# class loyalty_programm which have multiple users and transaction, config and rule engine
#
class LoyaltyProgram
  attr_accessor :users

  def initialize
    @users = []
  end

  def add_user(user)
    @users << user
  end
end
