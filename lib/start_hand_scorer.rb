require './user_interface'

cards = []
ui = UserInterface.new

5.times do
  ui.prompt_user_for_card
  cards.push(gets.chomp)
end