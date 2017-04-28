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

  def get_high_card
    high_rank = @cards[0].get_rank
    high_card = nil
    @cards.each do |card|
      current_rank = card.get_rank
      if current_rank > high_rank then
        high_card = card
      end 
    end
    return high_card
  end
end