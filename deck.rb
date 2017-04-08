# The deck should let us remove a card. It should tell us if a card is valid.
# After removing a card, the card should no longer be valid.
require './card'

class Deck

	def initialize
    @cards = []
    @suits = ["H" , "D", "S", "C"]
    @values = [1,2,3]
  
    @suits.each do |suit| 
      @values.each do |value|
        @cards.push(Card.new(suit, value))
      end
    end 
	end

	def validate(card)
    @suits.include?(card.suit) && @values.include?(card.value)
	end
	
	def remove(card)
    @cards.delete_if {|cardInDeck| cardInDeck.suit == card.suit && cardInDeck.value == card.value}
	end

  def contains(card)
   @cards.any? { |cardInDeck| cardInDeck.suit == card.suit && cardInDeck.value == card.value }
  end

end