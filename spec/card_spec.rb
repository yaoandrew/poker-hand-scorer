require_relative '../lib/card'
require_relative '../lib/deck'

RSpec.describe Card, '#rank' do
  context 'When rank is called a numerical value card' do
    it 'returns the rank of the card' do
      card = Card.new('C', 2)
      result = card.rank(Deck.values)
      expect(result).to eq 2
    end
  end
  context 'When rank is called with a face value card' do
    it 'returns the rank of the card' do
      card = Card.new('H', 'K')
      result = card.rank(Deck.values)
      expect(result).to eq 13
    end
  end
end