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
    card_occurences.has_value?(2)
  end

  def card_occurences
    hand = Hash.new(0)
    @cards.each { |card| hand[card.value] +=1 }
    hand
  end

  def contains_three_of_kind?
    card_occurences.value?(3)
  end

  def contains_four_of_kind?
    card_occurences.value?(4)
  end

  def contains_full_house?
    contains_pair? && contains_three_of_kind?
  end
end