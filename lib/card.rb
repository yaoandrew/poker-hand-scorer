require 'deck'

# Basic class to hold card attributes and calculate ordinal rank
class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def rank(face_ranks)
    if @value.is_a?(Integer)
      @value
    else
      face_ranks[@value]
    end
  end
end
