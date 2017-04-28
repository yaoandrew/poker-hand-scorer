require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Hand, '#add_card' do
  it 'should return nil' do
    hand = Hand.new
    expect(hand.add_card).to eq(nil)
  end
end
