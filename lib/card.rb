class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def rank(deck_values)
    deck_values.find_index(@value)
  end
end