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
    deduped_cards = @cards.uniq { |card| card.value }
    deduped_cards.length != @cards.length
  end
end
