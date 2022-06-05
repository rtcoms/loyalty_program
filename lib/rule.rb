# class Rule

class Rule
  attr_reader :type

  def should_apply?(user: nil, transactions: [])
    raise 'NOT IMPLEMENTED'
  end

  def apply(user: nil, transactions: [])
    raise 'NOT IMPLEMENTED'
  end
end