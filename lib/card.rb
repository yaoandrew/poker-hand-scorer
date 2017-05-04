# Basic class to hold card attributes and calculate ordinal rank
require 'deck'
class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def get_rank
    #face_ranks = {'K' => 13, 'Q' => 12, 'J' => 11, 'A' => 14}
    case @value
    when 2..10 then @value
    else
      Deck.FACE_RANKS[@value]
    end
  end
end
