require './card'

class Poker
  def prompt_user
    puts "Please enter a valid card (Ex. H2 is the Two of Hearts):"
  end
end

game = Poker.new
5.times do 
  game.prompt_user
end
