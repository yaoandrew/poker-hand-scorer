require 'hand'

class HandRanker

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
    card_sum == consecutive_sum || card_sum == 28 && all_unique?
  end

  def contains_flush?
    suit_occurences.value?(5)
  end

  def contains_straight_flush?
    contains_straight? && contains_flush?
  end

  def contains_royal_flush?
    card_sum == 60 && contains_flush?
  end
end