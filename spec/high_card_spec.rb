require_relative '../lib/high_card'

RSpec.describe HighCard, "#is_high_card" do
  it "returns nil" do
    hc = HighCard.new
    expect(hc.is_high_card?(true)).to equal(true)
  end
end