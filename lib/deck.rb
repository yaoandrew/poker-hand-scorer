class Deck

  ROYALS = [10].concat(%w[J Q K A])
  VALUES = [0, 0].concat(Array(2..9)).concat(ROYALS)
  SUITS = %w[H D S C]

  def initialize
    @cards = []
  end

  def valid_card?(card)
    SUITS.include?(card.suit) && VALUES.include?(card.value)
  end
end
