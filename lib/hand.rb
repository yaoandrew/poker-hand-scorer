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
    self.value_hash.has_value?(2)
  end

  def value_hash
    hand = Hash.new(0)
    @cards.each { |card| hand[card.value] +=1 }
    hand
  end

  def contains_three_of_kind?
    self.value_hash.has_value?(3)
  end

  def contains_four_of_kind?
    self.value_hash.has_value?(4)
  end

end
