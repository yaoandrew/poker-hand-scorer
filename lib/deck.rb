# The deck class is a representation of a valid deck of cards. It will validate the
# suit and hand of each card presented and return a boolean
require 'card'

class Deck

  @@FACE_RANKS = {'K' => 13, 'Q' => 12, 'J' => 11, 'A' => 14}
  def initialize
    @cards = []
    @suits = %w(H D S C)
    @values = Array(2..10) + %w(A K Q J)
  end

  def self.FACE_RANKS
    @@FACE_RANKS
  end

  def valid_card?(card)
    @suits.include?(card.suit) && @values.include?(card.value)
  end
end
