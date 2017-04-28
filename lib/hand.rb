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
    highest_rank = @cards[0].get_rank
    highest_card = nil
    @cards.each do |card|
      current_rank = card.get_rank
      if current_rank >= highest_rank then
        highest_card = card
      end 
    end
    return highest_card
  end
end