SUITS = [:hearts, :spades, :clubs, :diamonds]
VALUES = [*2..14]
ALL_CARDS = SUITS.product(VALUES)

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    raise "Invalid suit" unless SUITS.include?(suit)
    raise "Invalid value" unless VALUES.include?(value)

    @suit = suit
    @value = value
  end

end
