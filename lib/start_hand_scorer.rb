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

until hand.is_complete_hand?
  ui.prompt_user_for_card
  ui.get_input
  creator = CardCreator.new(ui.input)
  card = creator.create_card

  if card && deck.valid_card?(card)
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
ui.show_hand_results(hand_evaluator.get_best_hand(hand))
