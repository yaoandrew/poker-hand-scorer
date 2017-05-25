require_relative '../lib/deck'
require_relative '../lib/card'

RSpec.describe Deck, '#valid_card?' do
  context 'When the given card is valid' do 
    it 'returns true' do
      deck = Deck.new
      card = Card.new('C', 2)
      result = deck.valid_card?(card)
      expect(result).to eq true
    end
  end
  context 'When a given card is not valid' do
    it 'returns false' do
      deck = Deck.new
      card = Card.new('X', 12)
      result = deck.valid_card?(card)
      expect(result).to eq false
    end
  end
  context 'When the deck is asked' do
    it 'returns its values array' do
      result = Deck.values
      expect(result).to eq [0, 0, 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
    end
  end
end