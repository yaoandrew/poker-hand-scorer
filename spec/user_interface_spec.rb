require_relative '../lib/user_interface'

RSpec.describe UserInterface, '#prompt_user_for_card' do
  it 'prompts the user to enter a card' do
    ui = UserInterface.new
    prompt = 'Please enter a valid card (Ex. 2H is the Two of Hearts):'
    expect{ui.prompt_user_for_card}.to output(prompt).to_stdout
  end
end

RSpec.describe UserInterface, '#show_hand_results' do
  it 'takes a result and displays it' do
    ui = UserInterface.new
    hand_rank = 'Royal Flush'
    result = "Congrats, you have a... Royal Flush\n"
    expect{ui.show_hand_results(hand_rank)}.to output(result).to_stdout
  end
end
