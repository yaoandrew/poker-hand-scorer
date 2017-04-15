require './deck'
require './card'

RSpec.describe Deck, "#contains_card?" do
  context "When the given card is in the deck" do
    it "returns true if the card is in the deck" do
      deck = Deck.new
      card = Card.new("H", 3)
      result = deck.contains_card?(card)
      expect(result).to eq true
    end
  end
  context "When the given card is not in the deck" do
    it "returns false if the card is not in the deck" do
      deck = Deck.new
      card = Card.new("A", 100)
      result = deck.contains_card?(card)
      expect(result).to eq false
    end
  end
end

RSpec.describe Deck, "#valid_card?" do
    context "When the given card is valid" do 
      it "returns true if a card is valid when given a valid card" do
        deck = Deck.new
        card = Card.new("C", 2)
        result = deck.valid_card?(card)
        expect(result).to eq true
      end
    end
    context "When a given card is not valid" do
      it "returns false if a card is not valid when given an invalid card" do
        deck = Deck.new
        card = Card.new("X", 12)
        result = deck.valid_card?(card)
        expect(result).to eq false
      end
    end
end

RSpec.describe Deck, "#remove" do
  context "When a given card is not removed from the deck" do
    it "should be in the deck after being removed" do
      deck = Deck.new
      card = Card.new("H", 1)
      result = deck.contains_card?(card)
      expect(result).to eq true
    end
  end
  context "When a given card is removed from the deck" do
    it "should not be in the deck after being removed" do
      deck = Deck.new
      card = Card.new("H", 1)
      deck.remove(card)

      result = deck.contains_card?(card)
      expect(result).to eq false
    end
  end
end