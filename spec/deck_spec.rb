require './deck'

RSpec.describe Deck do
  it { should_not be_empty}
end



# Acceptance Criteria: Card should be able to be removed from Deck
# Example Unit Test: - Given a deck with 10 cards
# - When removeCard(someCard)
# - Then, when getDeck() is called, someCard should not be in the array of cards returned

# Given a deck with 20 cards
# - When validateCard(someCard), it should return if someCard is a valid card
# - methods - remove, validate, contains