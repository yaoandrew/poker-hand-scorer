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
    card_occurences.value?(2)
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

  def contains_straight?
    #low_card.value == 2 && rank_difference == 12 || rank_difference == 4
    #consecutive_range.compare(@cards.map { |card| card.rank(Deck.FACE_RANKS) })
    if ace_low_straight?
      return true
    end
    royal_sum == consecutive_sum
  end

  def contains_flush?
    suit_occurences.value?(5)
  end

  def contains_royal_flush?
    royal_sum == 60 && contains_flush?
  end

  def low_card
    @cards.min_by { |card| card.rank(Deck.FACE_RANKS) }
  end

  def rank_difference
    high_card.rank(Deck.FACE_RANKS) - low_card.rank(Deck.FACE_RANKS)
  end

  def consecutive_sum
    card_range = low_card.rank(Deck.FACE_RANKS)..high_card.rank(Deck.FACE_RANKS)
    card_range.reduce(:+)
  end

  def card_occurences
    hand = Hash.new(0)
    @cards.each { |card| hand[card.value] += 1 }
    hand
  end

  def suit_occurences
    hand = Hash.new(0)
    @cards.each { |card| hand[card.suit] += 1 }
    hand
  end

  def royal_sum
    @cards.collect { |card| card.rank(Deck.FACE_RANKS)}
          .inject { |sum, card| sum + card}
  end

  def ace_low_straight?
    puts royal_sum
    royal_sum == 28 && low_card.value == 2
  end
end