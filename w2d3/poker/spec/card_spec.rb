require 'rspec'
require 'card'

describe Card do
  let(:card1) { Card.new(:hearts, 7) }
  let(:card2) { Card.new(:spades, 14) }

  describe '#initialize' do
    it "initializes a card with a valid suit" do
      expect(card1.suit).to eq(:hearts)
      expect(card2.suit).to eq(:spades)
    end

    it "initializes a card with a value from 2 to 14" do
      expect(card1.value).to eq(7)
      expect(card2.value).to eq(14)
    end

    it "raises an error if suit or value is invalid" do
      expect { Card.new(:blue, 10) }.to raise_error("Invalid suit")
      expect { Card.new(:clubs, 24) }.to raise_error("Invalid value")
    end
  end

end
