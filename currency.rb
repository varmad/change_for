class Currency
  AVAILABLE_COINS = {
    quarters: 25,
    dimes: 10,
    nickels: 5,
    pennies: 1
  }.freeze

  def self.change_for(amount)
    coins = make_change(amount)
    format_output(coins)
  rescue ArgumentError => e
    "Error: #{e.message.capitalize}"
  end

  def self.make_change(amount)
    given_coins = AVAILABLE_COINS.values
    coins = []
    index = 0
    coin = given_coins[index]
    remaining_amount = amount

    until remaining_amount.zero?
      until remaining_amount >= coin
        index += 1
        coin = given_coins[index]
      end
      coins << coin
      remaining_amount -= coin
    end
    coins.tally
  end

  def self.format_output(coins)
    change = {}
    coins.each do |coin|
      data_key = AVAILABLE_COINS.key(coin.first).to_s
      change[data_key] = coin.last
    end
    change
  end
end
