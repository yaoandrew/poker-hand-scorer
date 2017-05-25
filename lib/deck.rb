class Deck

  @@VALUES = [0,0].concat(Array(2..10)).concat(%w(J Q K A)) 

  def initialize
    @cards = []
    @suits = %w(H D S C)
  end

  def self.values
    @@VALUES
  end

  def valid_card?(card)
    @suits.include?(card.suit) && @@VALUES.include?(card.value)
  end
end