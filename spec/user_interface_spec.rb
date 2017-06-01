require_relative '../lib/user_interface'

RSpec.describe UserInterface, '#prompt_user_for_card' do
  it 'prompts the user to enter a card' do
    ui = UserInterface.new
    prompt = 'Please enter a valid card (Ex. 2H is the Two of Hearts):'
    expect{ui.prompt_user_for_card}.to output(prompt).to_stdout
  end
end
