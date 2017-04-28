# Basic class to hold card attributes and calculate ordinal rank
class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def get_rank
    case @value
    when 2..10 then @value
    when 'K' then 13
    when 'Q' then 12
    when 'J' then 11
    when 'A' then 14
    end
  end
end
