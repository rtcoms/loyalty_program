require 'securerandom'

class User
  attr_reader :id, :name, :points_details, :transactions

  def initialize(name: )
    @id = SecureRandom.uuid
    @name = name
    @transactions = []
  end

  def set_points_details(points_details)
    @points_details = points_details
  end

  def add_transaction(transaction)
    @transactions << transaction
  end

  def monthwise_transactions
    @transactions.group_by { |t| t.date.strftime('%Y-%m') }
  end

  def current_month_transactions
    monthwise_transactions[Date.today.strftime('%Y-%m')]
  end
end