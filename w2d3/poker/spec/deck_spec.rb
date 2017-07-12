require 'rspec'
require 'deck'
require 'card'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it "creates an array of cards" do
      expect(deck.cards).to be_an(Array)
    end
  end

  describe '#populate_cards' do

    it "adds all 52 cards to the deck" do
      deck_array = []
      deck.cards.each do |card|
        deck_array << [card.suit, card.value]
      end
      expect(deck_array).to eq(ALL_CARDS)
    end
  end

  describe '#shuffle!' do
    it "modifies the deck" do
      old_cards = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).to_not eq(old_cards)
    end

    it "modifies the deck twice" do
      deck.shuffle!
      old_cards = deck.cards.dup
      deck.shuffle!
      expect(deck.cards).to_not eq(old_cards)
    end
  end

  describe '#deal_hand' do
    it "returns 5 cards" do
      expect(deck.deal_hand.length).to eq(5)
    end

    it "removes those 5 cards from the deck" do
      deck.deal_hand
      expect(deck.cards.length).to eq(47)
    end

    it "must return unique cards" do
      hand = deck.deal_hand
      expect(hand.uniq.length).to eq(5)
    end

  end
end
