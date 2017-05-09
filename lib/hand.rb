require 'deck'

# Represents a collection of cards and methods to evaluate the collection
class Hand

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards.push(card)
  end

  def contains_card?(card)
    @cards.include?(card)
  end

  # Uses Enumerable method max_by to find highest card.rank in the collection
  def high_card
    @cards.max_by { |card| card.rank(Deck.FACE_RANKS) }
  end

  def contains_pair?
    self.value_hash.has_value?(2)
  end

  def value_hash
    hand = Hash.new(0)
    @cards.each { |card| hand[card.value] +=1 }
    hand
  end
end
