class Deck

  ROYALS = [10].concat(%w[J Q K A])
  VALUES = [0, 0].concat(Array(2..9)).concat(ROYALS)
  
  def initialize
    @cards = []
    @suits = %w[H D S C]
  end

  def valid_card?(card)
    @suits.include?(card.suit) && VALUES.include?(card.value)
  end
end