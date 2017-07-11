require 'byebug'
require 'singleton'
module SteppingPiece

  def moves
    new_moves = move_dirs.map  { |move| [move[0] + pos[0], move[1] + pos[1]] }
    new_moves.select { |move| valid_move?(move) }
  end
end

module SlidingPiece

  def moves
    new_moves = []

    move_dirs.each do |move|
      next_pos = [move[0] + pos[0], move[1] + pos[1]]
      while valid_move?(next_pos)
        new_moves << next_pos
        break unless board[next_pos].is_a? NullPiece
        next_pos = [move[0] + next_pos[0], move[1] + next_pos[1]]
      end
    end

    new_moves
  end
end

class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(pos, board, color)
    @board = board
    @pos = pos
    @color = color
  end

  def to_s
    # self.value.to_s
    "X"
  end

  def valid_moves

  end

  def move_into_chec?(end_pos)

  end

  def valid_move?(pos)
    return false unless (0..7).include?(pos.first) && (0..7).include?(pos.last)
    # debugger
    return false if board[pos].color == self.color
    true
  end


end

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :white
  end

  def to_s
    " "
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
    "♞"
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
    "♚"
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
    "♛"
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
    "♜"
  end

  def move_dirs
    return ROOK_MOVES
  end
end

class Bishop < Piece
  include SlidingPiece

  BISHOP_MOVES = [
                 [1,1], [-1,-1],
                 [1,-1], [-1,1]
               ]

  def to_s
    "♝"
  end

  def move_dirs
    return BISHOP_MOVES
  end
end

class Pawn < Piece
  # include SteppingPiece
  attr_reader :start_pos
  PAWN_MOVES = [
                 [1,0], [-1,0]
               ]
  PAWN_START_MOVES = [
                 [1,0], [-1,0],
                 [2,0], [-2,0]
               ]
  PAWN_DIAG  = [
    [1,1], [-1,-1],
    [1,-1], [-1,1]
              ]
  def initialize(pos, board, color)
    @pos = pos
    @color = color
    @board = board
    @start_pos = pos
  end

  def to_s
    "♟"
  end

  def moves
    new_moves = []
    # debugger
    vertical_dirs = correct_directions(self.vertical_dirs)
    vertical_dirs.each do |move|
      next_pos = [move[0] + pos[0], move[1] + pos[1]]
      new_moves << next_pos
      break unless board[next_pos].is_a? NullPiece
    end
    new_moves.select {|move| valid_move?(move) }

    diag_dirs = correct_directions(PAWN_DIAG)
    diag_dirs.each do |move|
      new_pos = [move[0] + pos[0], move[1] + pos[1]]
      next unless valid_move?(new_pos)
      if !board[new_pos].is_a?(NullPiece) && board[new_pos].color != self.color
        new_moves << new_pos
      end
    end

    new_moves
  end

  def vertical_dirs
    if self.pos == start_pos
      PAWN_START_MOVES
    else
      PAWN_MOVES
    end
  end

  def correct_directions(dirs)
    case self.start_pos.first
    when 1
      dirs.select {|move| move.first > 0 }
    when 6
      dirs.select {|move| move.first < 0 }
    end
  end

end
