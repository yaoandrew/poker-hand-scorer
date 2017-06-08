class UserInterface
  attr_reader :input

  def prompt_user_for_card
    print 'Please enter a valid card (Ex. 2H is the Two of Hearts):'
  end

  def get_input
    @input = gets.chomp
  end

  def card_exists
    puts 'ERROR:  This card already exists in the hand'
  end

  def invalid_card
    puts 'ERROR:  This is not a valid card'
  end

  def hand_results(result, hand)
    puts "Congrats, you have a... #{result}"
  end
end
