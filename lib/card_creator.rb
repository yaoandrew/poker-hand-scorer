class CardCreator
  require_relative 'card'
  require_relative 'deck'
  attr_accessor :suit, :value

  def initialize(input_string)
    if input_string.length > 2
      @value = input_string[0] + input_string[1]
      @suit = input_string[2]
    else
      @value = input_string[0]
      @suit = input_string[1]
    end

    if @value.to_i.between?(2, 10)
      @value = @value.to_i
    end
  end

  def create_card
    deck = Deck.new
    if deck.valid_suit?(@suit) && deck.valid_value?(@value)
      Card.new(@suit, @value)
    end
  end
end
