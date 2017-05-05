require 'deck'

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

  def high_card
    @cards.max_by { |card| card.rank(Deck.FACE_RANKS) }
  end

  def contains_pair?
    deduped_cards = @cards.uniq { |card| card.value }
    deduped_cards.length != @cards.length
  end
end
