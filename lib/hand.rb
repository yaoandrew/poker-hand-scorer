class Hand
  HAND_TYPES = { RF: 'Royal Flush',
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

  def add_card(card)
    @cards.push(card)
  end

  def contains_card?(card)
    @cards.include?(card)
  end

  def high_card
    @cards.max_by { |card| card.rank(Deck::VALUES) }
  end

  def low_card
    @cards.min_by { |card| card.rank(Deck::VALUES) }
  end

  def rank_difference
    high_card.rank(Deck::VALUES) - low_card.rank(Deck::VALUES)
  end

  def consecutive_sum
    card_range = low_card.rank(Deck::VALUES)..high_card.rank(Deck::VALUES)
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
    @cards.collect { |card| card.rank(Deck::VALUES)}
          .inject { |sum, card| sum + card}
  end

  def all_unique?
    card_occurences.count { |_k, v| v == 1 } == @cards.length
  end

  def royal_flush_sum
    Deck::ROYALS.collect { |card_value| Deck::VALUES.find_index card_value}
                           .inject { |sum, card_value| sum + card_value }
  end

  def ace_low_straight_sum
    #slice VALUES to get ace low 
    Deck::ACE_LOW_STRAIGHT.collect { |card_value| Deck::VALUES.find_index card_value}
                  .inject { |sum, card_value| sum + card_value }
  end
end