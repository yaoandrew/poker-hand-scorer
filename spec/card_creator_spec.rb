require_relative '../lib/card'
require_relative '../lib/card_creator.rb'

RSpec.describe CardCreator, '#new' do
  context 'When the card creator is initialized with a string length of 2' do
    it 'assigns the correct values to @suit' do
      card_creator = CardCreator.new('4D')
      suit = card_creator.suit
      expect(suit).to eq("D")
    end
  end
  context 'When the card creator is initialized with a string length of 2' do
    it 'assigns the correct values to @value' do
      card_creator = CardCreator.new('5D')
      value = card_creator.value
      expect(value).to eq 5
    end
  end
  context 'When the card creator is initialized with a string length of 3' do
    it 'assigns the correct values to @suit' do
      card_creator = CardCreator.new('10H')
      suit = card_creator.suit
      expect(suit).to eq("H")
    end
  end
  context 'When the card creator is initialized with a string length of 3' do
    it 'assigns the correct values to @value' do
      card_creator = CardCreator.new('10H')
      value = card_creator.value
      expect(value).to eq 10
    end
  end
end
