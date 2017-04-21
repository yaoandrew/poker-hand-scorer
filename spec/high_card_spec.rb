require_relative '../lib/high_card'

RSpec.describe HighCard do
  it "exists" do
    high_card = HighCard.new
    expect(high_card).to exist 
  end
end