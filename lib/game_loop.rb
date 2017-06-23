class GameLoop
  attr_accessor :ui, :deck, :hand
  def initialize(ui, deck, hand)
    @ui = ui
    @deck = deck
    @hand = hand
  end

  def build_hand(card)
    if card && deck.valid_card?(card)
      if !hand.contains_card?(card)
        hand.add_card(card)
      else
        ui.card_exists
      end
    else
        ui.invalid_card
    end
  end

  def start
    until hand.is_complete_hand?
      ui.prompt_user_for_card
      ui.get_input
      creator = CardCreator.new(ui.input)
      card = creator.create_card
      build_hand(card)
    end
  end
end
