class UserInterface
  def prompt_user_for_card
    print 'Please enter a valid card (Ex. 2H is the Two of Hearts):'
  end

  def card_exists
    puts 'ERROR:  This card already exists in the hand'
  end

  def invalid_card
    puts 'ERROR:  This is not a valid card'
  end

  def hand_results
    print 'Congrats, you have a... '
  end
end