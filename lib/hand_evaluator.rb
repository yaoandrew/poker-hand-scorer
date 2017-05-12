class HandEvaluator
  def best_hand(hand)
    if hand.contains_royal_flush?
      hand.HAND_TYPE[:RF]
    elsif hand.contains_straight_flush?
      hand.HAND_TYPE[:SF]
    elsif hand.contains_four_of_kind?
      hand.HAND_TYPE[:FK]
    elsif hand.contains_full_house?
      hand.HAND_TYPE[:FH]
    elsif hand.contains_flush?
      hand.HAND_TYPE[:FL]
    elsif hand.contains_straight?
      hand.HAND_TYPE[:ST]
    elsif hand.contains_three_of_kind?
      hand.HAND_TYPE[:TK]
    end
  end
end