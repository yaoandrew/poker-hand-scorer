#!/usr/local/bin/ruby

require_relative 'user_interface'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'hand_evaluator'
require_relative 'hand_ranker'
require_relative 'card_creator'


ui = UserInterface.new
deck = Deck.new
hand = Hand.new

while hand.length < 5
  ui.prompt_user_for_card
  input_string = gets.chomp
  creator = CardCreator.new(input_string)
  card = creator.create_card

  if deck.valid_card?(card)
    if !hand.contains_card?(card)
      hand.add_card(card)
    else
      ui.card_exists
    end
  else
    ui.invalid_card
  end
end

hand_ranker = HandRanker.new (hand)
hand_evaluator = HandEvaluator.new(hand_ranker)

ui.hand_results
puts hand_evaluator.best_hand(hand)