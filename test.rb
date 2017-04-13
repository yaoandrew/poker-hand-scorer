require './deck'

deck = Deck.new
puts "Validation test- should be true"
  puts deck.valid_card?(Card.new("H", 3))
puts "Contains test - should be true"
  puts deck.contains_card?(Card.new("H", 3))
puts "Remove test - should be false"
  deck.remove(Card.new("H", 3))
  puts deck.contains_card?(Card.new("H", 3))