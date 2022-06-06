require 'securerandom'

class User
  attr_reader :id, :name, :points_details, :transactions, :reward_details

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
    @monthwise_transaction ||= @transactions.group_by { |t| t.date.strftime('%Y-%m') }
  end

  def transactions_for_month(month)
    monthwise_transactions[month]
  end

  def points_for_month(month)
    @points_details[:monthwise_points].find { |p| p[:month] == month }[:points]
  end
end