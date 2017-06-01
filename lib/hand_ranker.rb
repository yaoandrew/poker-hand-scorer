class HandRanker
  def initialize(hand)
    @hand = hand
  end

  def contains_pair?
    @hand.card_occurrences.value?(2)
  end

  def contains_three_of_kind?
    @hand.card_occurrences.value?(3)
  end

  def contains_four_of_kind?
    @hand.card_occurrences.value?(4)
  end

  def contains_full_house?
    contains_pair? && contains_three_of_kind?
  end

  def contains_two_pair?
    @hand.card_occurrences.select { |_k, v| v == 2 }.count == 2
  end

  def contains_straight?
    @hand.card_sum == @hand.consecutive_sum ||
      @hand.card_sum == @hand.ace_low_straight_sum && @hand.all_unique?
  end

  def contains_flush?
    @hand.suit_occurrences.value?(5)
  end

  def contains_straight_flush?
    contains_straight? && contains_flush?
  end

  def contains_royal_flush?
    @hand.card_sum == @hand.royal_flush_sum && contains_flush?
  end
end
