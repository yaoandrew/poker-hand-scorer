# The deck class is a representation of a valid deck of cards. It will validate the
# suit and hand of each card presented and return a boolean
require 'card'

class Deck
  def initialize
    @cards = []
    @suits = %w(H D S C)
    @values = Array(2..10) + %w(A K Q J)
  end

  def valid_card?(card)
    @suits.include?(card.suit) && @values.include?(card.value)
  end
end

deck = Deck.new
puts deck.inspect