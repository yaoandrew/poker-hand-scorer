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

  def low_card
    @cards.min_by { |card| card.rank(Deck.FACE_RANKS) }
  end

  def rank_difference
    high_card.rank(Deck.FACE_RANKS) - low_card.rank(Deck.FACE_RANKS)
  end

  def contains_pair?
    card_occurences.value?(2)
  end

  def card_occurences
    hand = Hash.new(0)
    @cards.each { |card| hand[card.value] += 1 }
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

  def contains_two_pair?
    card_occurences.select { |_k, v| v == 2}.count == 2
  end

  def suit_occurences
    hand = Hash.new(0)
    @cards.each { |card| hand[card.suit] += 1 }
    hand
  end

  def contains_flush?
    suit_occurences.value?(5)
  end

  def royal_sum
    @cards.collect { |card| card.rank(Deck.FACE_RANKS)}
          .inject { |sum, card| sum + card}
  end

  def contains_royal_flush?
    royal_sum == 60 && contains_flush?
  end

  def contains_straight?
    low_card.value == 2 && rank_difference == 12 || rank_difference == 4
  end
end