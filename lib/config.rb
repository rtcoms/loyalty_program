class Config
  USD = 'usd'
  INR = 'inr'
  SGD = 'sgd'

  SUPPORTED_CURRENCY_LIST = [USD, INR, SGD]

  CURRENCY_EXCHANGE_RATES = {
    USD => 1,
    INR => 80,
    SGD => 50
  }

  STANDARD_TIER = :standard_tier
  GOLD_TIER = :gold_tier
  PLATINUM_TIER = :platinum_tier

  TIERS_LIST = [STANDARD_TIER, GOLD_TIER, PLATINUM_TIER]
end