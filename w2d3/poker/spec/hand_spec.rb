require 'rspec'
require 'hand'
require 'deck'

describe Hand do
  # deck = Deck.new
  # deck.shuffle!
  # hand_cards = deck.deal_hand
  # subject(:hand) { Hand.new(hand_cards) }

  let(:card1) {double ("card1", {suit: :clubs, value: 8 } ) }
  let(:card2) {double ("card2", {suit: :spades, value: 8 } ) }
  let(:card3) {double ("card3", {suit: :hearts, value: 8 } ) }
  let(:card4) {double ("card4", {suit: :clubs, value: 8 } ) } 
  let(:card5) {double ("card5", {suit: :clubs, value: 8 } ) }

  describe '#initialize' do
    it "initializes with a set of 5 cards" do
      expect(hand.cards.length).to eq(5)
      expect(hand.cards == hand_cards)
    end
  end

  describe '#rank' do
    it "returns value of best card in the hand" do
      expect()
    end

  end
end
