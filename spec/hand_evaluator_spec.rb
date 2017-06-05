require_relative '../lib/card'
require_relative '../lib/hand'
require_relative '../lib/hand_evaluator'
require_relative '../lib/hand_ranker'

RSpec.describe HandEvaluator, '#best_hand' do
  context 'When best hand is called with a high card hand' do
    it 'returns the string High Card' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      hand_scorer = HandEvaluator.new(hand_ranker)
      card1 = Card.new('C', 2)
      card2 = Card.new('D', 6)
      card3 = Card.new('H', 9)
      card4 = Card.new('S', "J")
      card5 = Card.new('C', "A")
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_scorer.best_hand(hand)
      expect(result).to eq 'High Card'
    end
  end
  context 'When best hand is called with a royal flush' do
    it 'returns string Royal Flush' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      hand_scorer = HandEvaluator.new(hand_ranker)
      card1 = Card.new('H', 10)
      card2 = Card.new('H', 'K')
      card3 = Card.new('H', 'Q')
      card4 = Card.new('H', 'J')
      card5 = Card.new('H', 'A')
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_scorer.best_hand(hand)
      expect(result).to eq 'Royal Flush'
    end
  end
  context 'When best hand is called with a straight flush' do
    it 'returns string Straight Flush' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      hand_scorer = HandEvaluator.new(hand_ranker)
      card1 = Card.new('H', 7)
      card2 = Card.new('H', 8)
      card3 = Card.new('H', 9)
      card4 = Card.new('H', 10)
      card5 = Card.new('H', 'J')
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_scorer.best_hand(hand)
      expect(result).to eq 'Straight Flush'
    end
  end
  context 'When best hand is called with a four of a kind' do
    it 'returns string Four of a Kind' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      hand_scorer = HandEvaluator.new(hand_ranker)
      card1 = Card.new('H', 7)
      card2 = Card.new('C', 7)
      card3 = Card.new('S', 7)
      card4 = Card.new('D', 7)
      card5 = Card.new('H', 'J')
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_scorer.best_hand(hand)
      expect(result).to eq 'Four of a Kind'
    end
  end
  context 'When best hand is called with a full house' do
    it 'returns string Full House' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      hand_scorer = HandEvaluator.new(hand_ranker)
      card1 = Card.new('H', 7)
      card2 = Card.new('C', 7)
      card3 = Card.new('S', 2)
      card4 = Card.new('D', 2)
      card5 = Card.new('H', 2)
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_scorer.best_hand(hand)
      expect(result).to eq 'Full House'
    end
  end
  context 'When best hand is called with a flush' do
    it 'returns string Flush' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      hand_scorer = HandEvaluator.new(hand_ranker)
      card1 = Card.new('D', 7)
      card2 = Card.new('D', 7)
      card3 = Card.new('D', 2)
      card4 = Card.new('D', 2)
      card5 = Card.new('D', 'K')
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_scorer.best_hand(hand)
      expect(result).to eq 'Flush'
    end
  end
  context 'When best hand is called with a straight' do
    it 'returns string Straight' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      hand_scorer = HandEvaluator.new(hand_ranker)
      card1 = Card.new('D', 7)
      card2 = Card.new('C', 8)
      card3 = Card.new('S', 9)
      card4 = Card.new('D', 10)
      card5 = Card.new('H', 'J')
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_scorer.best_hand(hand)
      expect(result).to eq 'Straight'
    end
  end
  context 'When best hand is called with a three of a kind' do
    it 'returns string Three of a Kind' do
      hand = Hand.new
      hand_ranker = HandRanker.new(hand)
      hand_scorer = HandEvaluator.new(hand_ranker)
      card1 = Card.new('D', 7)
      card2 = Card.new('C', 7)
      card3 = Card.new('S', 7)
      card4 = Card.new('D', 10)
      card5 = Card.new('H', 'J')
      hand.add_card(card1)
      hand.add_card(card2)
      hand.add_card(card3)
      hand.add_card(card4)
      hand.add_card(card5)
      result = hand_scorer.best_hand(hand)
      expect(result).to eq 'Three of a Kind'
    end
  end
end