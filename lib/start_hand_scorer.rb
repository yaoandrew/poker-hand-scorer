require_relative 'user_interface'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'

ui = UserInterface.new

# deck.valid_card?
# hand.contains_card?
# hand.add_card



def parse_input(input_string)
  suit = input_string[1]
  value = input_string[0]
  card = Card.new(suit, value)
  deck = Deck.new
  hand = Hand.new
  p card
  deck.valid_card?(card)

end

5.times do
  ui.prompt_user_for_card
  p parse_input(gets.chomp)

end