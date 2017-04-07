require './deck'

deck = Deck.new
puts "Validation test"
puts deck.validate(Card.new("H", 3))
puts "Contains test"
puts deck.contains(Card.new("H", 3))
puts "REmove test"
deck.remove(Card.new("H", 3))
puts deck.contains(Card.new("H", 3))
