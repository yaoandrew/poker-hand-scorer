require './deck'
require './card'

RSpec.describe Deck, "#contains_card?" do
	it "returns if a card is in the deck when given a valid card" do
		deck = Deck.new
		expect(deck.contains_card?(Card.new("H", 3))).to eq true
	end
end

RSpec.describe Deck, "#valid_card?" do
		context "When the given card is valid" do 
			it "returns true if a card is valid when given a valid card" do
				deck = Deck.new
				expect(deck.valid_card?(Card.new("C", 2))).to eq true
			end
		end
		context "When a given card is not valid" do
			it "returns false if a card is not valid when given an invalid card" do
				deck = Deck.new
				expect(deck.valid_card?(Card.new("X", 12))).to eq false
			end
		end
end

RSpec.describe Deck, "#remove" do
	it "should not be in the deck after being removed" do
		deck = Deck.new
		card = Card.new("H", 1)
		deck.remove(card)
		expect(deck.contains_card?(card)).to eq false
	end
end
