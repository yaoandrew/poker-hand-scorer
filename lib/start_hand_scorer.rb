#!/usr/local/bin/ruby

require_relative 'user_interface'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'


# deck.valid_card?
# hand.contains_card?
# hand.add_card

class CardCreator
  require_relative 'card'
  require_relative 'deck'
  attr_accessor :suit, :value

  def initialize(input_string)
    @suit = input_string[1]
    @value = input_string[0]

    if @value.to_i.between?(2, 10)
      @value = input_string[0].to_i
    end
  end

  def create_card
    Card.new(@suit, @value)
  end
end

class HandCreator
  require_relative 'hand'
  hand = Hand.new
  hand
end

ui = UserInterface.new
ui.prompt_user_for_card
input_string = gets.chomp
creator = CardCreator.new(input_string)
card = creator.create_card

deck = Deck.new
hand = Hand.new

p deck.valid_card?(card)

hand.add_card(card)

p hand.inspect
p card.suit
