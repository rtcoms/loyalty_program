# class Rule

class Rule
  def should_apply?(user: nil, monthwise_transactions: [])
    raise 'NOT IMPLEMENTED'
  end

  def apply(user: nil, monthwise_transactions: [])
    raise 'NOT IMPLEMENTED'
  end
end