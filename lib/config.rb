class Config
  USD = 'usd'
  INR = 'inr'
  SGD = 'sgd'

  SUPPORTED_CURRENCY_LIST = [USD, INR, SGD]

  EXCHANGE_RATES = {
    USD => {
      USD => 1,
      INR => 65,
      SGD => 1.5
    },
    INR => {
      USD => 0.01,
      INR => 1,
      SGD => 0.15
    },
    SGD => {
      USD => 0.7,
      INR => 0.01,
      SGD => 1
    }
  }

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