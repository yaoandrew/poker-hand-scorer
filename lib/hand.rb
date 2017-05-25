require 'deck'

class Hand

  @@HAND_TYPE = { RF: 'Royal Flush',
                  SF: 'Straight Flush',
                  FK: 'Four of a Kind',
                  FH: 'Full House',
                  FL: 'Flush',
                  ST: 'Straight',
                  TK: 'Three of a Kind',
                  TP: 'Two Pair',
                  PR: 'Pair',
                  HC: 'High Card' }

  def initialize
    @cards = []
  end

  def HAND_TYPE
    @@HAND_TYPE
  end

  def add_card(card)
    @cards.push(card)
  end

  def contains_card?(card)
    @cards.include?(card)
  end

  def high_card
    @cards.max_by { |card| card.rank(Deck.values) }
  end

  def low_card
    @cards.min_by { |card| card.rank(Deck.values) }
  end

  def rank_difference
    high_card.rank(Deck.values) - low_card.rank(Deck.values)
  end

  def consecutive_sum
    card_range = low_card.rank(Deck.values)..high_card.rank(Deck.values)
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

  def card_sum
    @cards.collect { |card| card.rank(Deck.values)}
          .inject { |sum, card| sum + card}
  end
  
  def all_unique?
    card_occurences.count { |k,v| v == 1} == 5
  end
end