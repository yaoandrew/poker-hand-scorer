require_relative '../lib/high_card'

RSpec.describe HighCard, '#high_card' do
  it 'returns nil' do
    hc = HighCard.new
    expect(hc.high_card?(true)).to equal(true)
  end
end
