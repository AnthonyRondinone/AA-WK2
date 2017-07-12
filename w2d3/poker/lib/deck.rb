require 'card'

class Deck

  attr_reader :cards
  def initialize
    @cards = []
    populate_cards
  end

  def populate_cards
    ALL_CARDS.each do |card|
      self.cards << Card.new(*card)
    end
  end

  def shuffle!
    cards.shuffle!
  end

  def deal_hand
    self.cards.pop(5)
  end
end
