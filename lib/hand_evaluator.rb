class HandEvaluator
  def initialize(ranker)
    @hand_ranker = ranker
  end

  def get_best_hand(hand)
    case
    when @hand_ranker.contains_royal_flush?
      Hand::HAND_TYPES[:RF]
    when @hand_ranker.contains_straight_flush?
      Hand::HAND_TYPES[:SF]
    when @hand_ranker.contains_four_of_kind?
      Hand::HAND_TYPES[:FK]
    when @hand_ranker.contains_full_house?
      Hand::HAND_TYPES[:FH]
    when @hand_ranker.contains_flush?
      Hand::HAND_TYPES[:FL]
    when @hand_ranker.contains_straight?
      Hand::HAND_TYPES[:ST]
    when @hand_ranker.contains_three_of_kind?
      Hand::HAND_TYPES[:TK]
    else
      Hand::HAND_TYPES[:HC]
    end
  end
end
