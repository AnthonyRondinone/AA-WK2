class Piece
  attr_reader :value

  def initialize(value = "X")
    @value = value
  end

  def to_s
    self.value.to_s
  end
end

class NullPiece < Piece
  def initialize
    super(value = "O")
  end
end
