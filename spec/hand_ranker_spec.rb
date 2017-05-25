require_relative '../lib/hand_ranker'
require_relative '../lib/hand'
require_relative '../lib/card'


RSpec.describe HandRanker, '#contains_pair?' do
  context 'When the hand contains 2 cards with the same value' do
    it 'returns true' do
      hand = Hand.new
      hand_ranker = HandRanker.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      hand.add_card(card1)
      hand.add_card(card2)
      result = hand_ranker.contains_pair?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain 2 cards with the same value' do
    it 'returns false' do
      hand = Hand.new
      hand_ranker = HandRanker.new
      card1 = Card.new('D', 6)
      card2 = Card.new('H', 4)
      hand.add_card(card1)
      hand.add_card(card2)
      result = hand_ranker.contains_pair?
      expect(result).to be false
    end
  end
end