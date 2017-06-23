require_relative '../lib/deck'
require_relative '../lib/hand'
require_relative '../lib/card'
require_relative '../lib/game_loop'
require_relative '../lib/user_interface.rb'

RSpec.describe GameLoop, '#build_hand' do
  context 'When build_hand is called with a valid card' do
    it 'adds a card to the hand' do
      ui = UserInterface.new
      deck = Deck.new
      hand = Hand.new
      card = Card.new("H", 8)
      game_loop = GameLoop.new(ui, deck, hand)
      game_loop.build_hand(card)
      result = hand.cards.size
      expect(result).to eq 1
    end
  end
end

RSpec.describe GameLoop, '#build_hand' do
  context 'When build_hand is called with an invalid card' do
    it 'does not add a card to the hand' do
      ui = UserInterface.new
      deck = Deck.new
      hand = Hand.new
      card = Card.new("H", 18)
      game_loop = GameLoop.new(ui, deck, hand)
      game_loop.build_hand(card)
      result = hand.cards.size
      expect(result).to eq 0
    end
  end
end

RSpec.describe GameLoop, '#build_hand' do
  context 'When build_hand is called with a duplicate card' do
    it 'does not add a card to the hand' do
      ui = UserInterface.new
      deck = Deck.new
      hand = Hand.new
      card = Card.new("H", 8)
      duplicate_card = Card.new("H", 8)
      game_loop = GameLoop.new(ui, deck, hand)
      game_loop.build_hand(card)
      game_loop.build_hand(duplicate_card)
      result = hand.cards.size
      expect(result).to eq 1
    end
  end
end
