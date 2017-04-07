# TO DO - should there be one file per class?

# Basic class to hold card attributes
class Card
	attr_reader :suit, :value
	def initialize(suit, value)
		@suit = suit
		@value = value
end

# The deck should let us remove a card. It should tell us if a card is valid.
# After removing a card, the card should no longer be valid.
class Deck
	def initialize
end