module SteppingPiece

  def moves
    new_moves = move_dirs.map  { |move| [move[0] + pos[0], move[1] + pos[1]] }
    new_moves.select { |move| valid_move?(move) }
  end
end

module SlidingPiece

  def moves 
    queue = [pos]

    until queue.empty?
      next_move = queue.shift
      new_moves =
    end

  end
end

class Piece
  attr_reader :board, :pos, :color

  def initialize(pos, board, color)
    @board = board
    @pos = pos
    @color = color
  end

  def to_s
    # self.value.to_s
    "X"
  end

  # def value
  #   "X"
  # end

  def valid_move?(pos)
    return false unless (0..7).include?(pos.first) && (0..7).include?(pos.last)
    return false if board[pos].color == self.color
    true
  end


end

class NullPiece < Piece
  def initialize(pos, board, color = :white)
    super
  end

  def to_s
    "_"
  end
end

class Knight < Piece
  include SteppingPiece

  KNIGHT_MOVES = [
                 [1,2],  [1,-2],
                 [-1,2], [-1,-2],
                 [2,1],  [2,-1],
                 [-2,1], [-2,-1]
               ]
  def to_s
    "k"
  end

  def move_dirs
    return KNIGHT_MOVES
  end
end

class King < Piece
  include SteppingPiece

  KING_MOVES = [
                 [0,1], [0,-1],
                 [1,0], [-1,0],
                 [1,1], [-1,-1]
               ]

  def to_s
    "K"
  end

  def move_dirs
    return KING_MOVES
  end
end

class Queen < Piece
  include SlidingPiece

  QUEEN_MOVES = [
                 [0,1], [0,-1],
                 [1,0], [-1,0],
                 [1,1], [-1,-1]
               ]

  def to_s
    "Q"
  end

  def move_dirs
    return QUEEN_MOVES
  end
end

class Rook < Piece
  include SlidingPiece

  ROOK_MOVES = [
                 [0,1], [0,-1],
                 [1,0], [-1,0],
               ]

  def to_s
    "R"
  end

  def move_dirs
    return ROOK_MOVES
  end
end

class Bishop < Piece
  include SlidingPiece

  BISHOP_MOVES = [
                 [1,1], [-1,-1]
               ]

  def to_s
    "B"
  end

  def move_dirs
    return BISHOP_MOVES
  end
end
