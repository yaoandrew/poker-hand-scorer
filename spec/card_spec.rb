require_relative '../lib/card'

RSpec.describe Card, '#get_rank' do
  context 'When get_rank is called a numerical value card' do
    it 'returns the rank of the card' do
      card = Card.new('C', 2)
      result = card.get_rank
      expect(result).to eq 2
    end
  end
  context 'When get_rank is called with a face value card' do
    it 'returns the rank of the card' do
      card = Card.new('H', 'K')
      result = card.get_rank
      expect(result).to eq (13)
    end
  end
end
