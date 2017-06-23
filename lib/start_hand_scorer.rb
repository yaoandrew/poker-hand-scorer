#!/usr/local/bin/ruby

require_relative 'user_interface'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'hand_evaluator'
require_relative 'hand_ranker'
require_relative 'card_creator'
require_relative 'game_loop'

ui = UserInterface.new
deck = Deck.new
hand = Hand.new
game_loop = GameLoop.new(ui, deck, hand)

game_loop.start

hand_ranker = HandRanker.new (hand)
hand_evaluator = HandEvaluator.new(hand_ranker)
ui.show_hand_results(hand_evaluator.get_best_hand(hand))
