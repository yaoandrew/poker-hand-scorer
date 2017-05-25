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

RSpec.describe Hand, '#high_card' do
  context 'When called with cards with numerical values' do
    it 'returns the highest card in the hand' do
      hand = Hand.new
      lower_card = Card.new('S', 3)
      high_card = Card.new('C', 10)
      hand.add_card(lower_card)
      hand.add_card(high_card)
      result = hand.high_card
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
      result = hand.high_card
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
      result = hand.high_card
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
      result = hand.high_card
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
      result = hand.high_card
      expect(result).to eq(high_card)
    end
  end
end

RSpec.describe Hand, '#contains_pair?' do
  context 'When the hand contains 2 cards with the same value' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      hand.add_card(card1)
      hand.add_card(card2)
      result = hand.contains_pair?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain 2 cards with the same value' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('D', 6)
      card2 = Card.new('H', 4)
      hand.add_card(card1)
      hand.add_card(card2)
      result = hand.contains_pair?
      expect(result).to be false
    end
  end
end

RSpec.describe Hand, '#contains_three_of_kind' do
  context 'When the hand contains 3 cards with the same value' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      result = hand.contains_three_of_kind?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain 3 cards with the same value' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', "Q")
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      result = hand.contains_three_of_kind?
      expect(result).to be false
    end
  end
end

RSpec.describe Hand, '#contains_four_of_kind' do
  context 'When the hand contains 4 cards with the same value' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('C', "J")
      card2 = Card.new('H', "J")
      card3 = Card.new('D', "J")
      card4 = Card.new('S', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      result = hand.contains_four_of_kind?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain 4 cards with the same value' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', "Q")
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "Q")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      result = hand.contains_four_of_kind?
      expect(result).to be false
    end
  end
end

RSpec.describe Hand, '#contains_full_house' do
  context 'When the hand contains a full house' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "K")
      card5 = Card.new('S', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_full_house?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a full house' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', "Q")
      card3 = Card.new('D', 4)
      card4 = Card.new('D', "K")
      card5 = Card.new('S', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_full_house?
      expect(result).to be false
    end
  end
end

RSpec.describe Hand, '#contains_two_pair' do
  context 'When the hand contains two pairs of matching cards' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      card3 = Card.new('D', 7)
      card4 = Card.new('D', "K")
      card5 = Card.new('S', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_two_pair?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain two pairs of matching cards' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('C', 4)
      card2 = Card.new('H', 4)
      card3 = Card.new('D', 7)
      card4 = Card.new('D', 3)
      card5 = Card.new('S', "K")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_two_pair?
      expect(result).to be false
    end
  end
end

RSpec.describe Hand, '#contains_flush' do
  context 'When the hand contains a flush' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('D', 4)
      card2 = Card.new('D', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('D', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_flush?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a flush' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('H', 4)
      card2 = Card.new('C', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('S', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_flush?
      expect(result).to be false
    end
  end
end

RSpec.describe Hand, '#contains_royal_flush' do
  context 'When the hand contains a royal flush' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('D', 10)
      card2 = Card.new('D', "Q")
      card3 = Card.new('D', "A")
      card4 = Card.new('D', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_royal_flush?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a royal flush' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('H', 4)
      card2 = Card.new('C', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('S', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_royal_flush?
      expect(result).to be false
    end
  end
end

RSpec.describe Hand, '#contains_straight' do
  context 'When the hand contains a straight' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('S', 10)
      card2 = Card.new('C', 9)
      card3 = Card.new('H', 8)
      card4 = Card.new('D', 7)
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_straight?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a straight' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('H', 4)
      card2 = Card.new('C', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('S', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_straight?
      expect(result).to be false
    end
  end
  context 'When the hand contains a straight with ace high' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('S', 10)
      card2 = Card.new('C', "J")
      card3 = Card.new('H', "Q")
      card4 = Card.new('D', "K")
      card5 = Card.new('D', "A")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_straight?
      expect(result).to be true
    end
  end
  context 'When the hand contains a straight with ace low' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('S', 5)
      card2 = Card.new('C', 4)
      card3 = Card.new('H', 3)
      card4 = Card.new('D', 2)
      card5 = Card.new('D', "A")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_straight?
      expect(result).to be true
    end
  end
  context 'When the hi/low difference is 4 and the hand is not a straight' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('S', 7)
      card2 = Card.new('C', 7)
      card3 = Card.new('H', 7)
      card4 = Card.new('D', 8)
      card5 = Card.new('D', 'J')
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_straight?
      expect(result).to be false
    end
  end
end

RSpec.describe Hand, '#contains_straight_flush' do
  context 'When the hand contains a straight flush' do
    it 'returns true' do
      hand = Hand.new
      card1 = Card.new('S', 10)
      card2 = Card.new('S', 9)
      card3 = Card.new('S', 8)
      card4 = Card.new('S', 7)
      card5 = Card.new('S', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_straight_flush?
      expect(result).to be true
    end
  end
  context 'When the hand does not contain a straight flush' do
    it 'returns false' do
      hand = Hand.new
      card1 = Card.new('H', 4)
      card2 = Card.new('C', 3)
      card3 = Card.new('D', 7)
      card4 = Card.new('S', "K")
      card5 = Card.new('D', "J")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand.contains_straight_flush?
      expect(result).to be false
    end
  end
end