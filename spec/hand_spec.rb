require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Hand, '#add_card' do
  context 'When the hand is given a card' do
    it 'adds the card to the hand' do
      hand = Hand.new
      card = Card.new('H', 'Q')
      hand.add_card(card)
      result = hand.contains_card?(card)
      expect(result).to eq true
    end
  end
end

RSpec.describe Hand, '#contains_card?' do
  context 'When the hand does not contain the given card' do
    it 'returns false' do
      hand = Hand.new
      card = Card.new('C', 'K')
      result = hand.contains_card?(card)
      expect(result).to eq false
    end
  end
end

RSpec.describe Hand, '#get_high_card' do
  context 'When called with cards with numerical values' do
    it 'returns the highest card in the hand' do
      hand = Hand.new
      lower_card = Card.new('S', 3)
      high_card = Card.new('C', 10)
      hand.add_card(lower_card)
      hand.add_card(high_card)
      result = hand.get_high_card
      expect(result).to eq(high_card)
    end
  end
  context 'When called with a face card and number card' do
    it 'returns the highest card in the hand' do
      hand = Hand.new
      lower_card = Card.new('S', 3)
      high_card = Card.new('C', 'K')
      hand.add_card(lower_card)
      hand.add_card(high_card)
      result = hand.get_high_card
      expect(result).to eq(high_card)
    end
  end
  context 'When called with two face cards' do
    it 'returns the highest card in the hand' do
      hand = Hand.new
      lower_card = Card.new('S', 'J')
      high_card = Card.new('C', 'K')
      hand.add_card(lower_card)
      hand.add_card(high_card)
      result = hand.get_high_card
      expect(result).to eq(high_card)
    end
  end
  context 'When the high_card is added before the low_card' do
    it 'returns the highest card in the hand' do
      hand = Hand.new
      high_card = Card.new('C', 'K')
      lower_card = Card.new('S', 'J')
      hand.add_card(high_card)
      hand.add_card(lower_card)
      result = hand.get_high_card
      expect(result).to eq(high_card)
    end
  end
  context 'When multiple cards are added' do
    it 'returns the highest card in the hand' do
      hand = Hand.new
      high_card = Card.new('C', 'K')
      card1 = Card.new('S', 'J')
      card2 = Card.new('H', 4)
      card3 = Card.new('S', 8)
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(high_card)
      hand.add_card(card3)
      result = hand.get_high_card
      expect(result).to eq(high_card)
    end
  end
end
