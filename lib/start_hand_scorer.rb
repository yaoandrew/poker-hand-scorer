#!/usr/local/bin/ruby

require_relative './user_interface'
require_relative './deck'
require_relative './card'
require_relative './hand'

ui = UserInterface.new
# deck.valid_card?
# hand.contains_card?
# hand.add_card

def parse_input(input_string)
  suit = input_string[1]
  value = input_string[0].to_i
  card = Card.new(suit, value)
  p deck.valid_card?(card)
  hand.add_card(card)
  p hand.inspect
end

5.times do
  ui.prompt_user_for_card
  parse_input(gets.chomp)
end