class HandEvaluator
  def initialize(ranker)
    @hand_ranker = ranker
  end

  def best_hand(hand)
    case
    when @hand_ranker.contains_royal_flush?
      hand.HAND_TYPES[:RF]
    when @hand_ranker.contains_straight_flush?
      hand.HAND_TYPES[:SF]
    when @hand_ranker.contains_four_of_kind?
      hand.HAND_TYPES[:FK]
    when @hand_ranker.contains_full_house?
      hand.HAND_TYPES[:FH]
    when @hand_ranker.contains_flush?
      hand.HAND_TYPES[:FL]
    when @hand_ranker.contains_straight?
      hand.HAND_TYPES[:ST]
    when @hand_ranker.contains_three_of_kind?
      hand.HAND_TYPES[:TK]
    else
      hand.HAND_TYPES[:HC]
    end
  end
end