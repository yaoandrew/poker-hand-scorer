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
    @cards.max_by { |card| card.get_rank }
  end
end