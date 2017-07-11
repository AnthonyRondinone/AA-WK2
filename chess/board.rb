require_relative 'pieces.rb'
# require_relative 'display.rb'
require 'byebug'

class Board

  attr_accessor :grid
  attr_reader :display

  # def self.empty_grid
  #   Array.new(8) do
  #     Array.new(8) { NullPiece.new }
  #   end
  # end

  def initialize(grid)
    @grid = grid
    populate_board
  end

  def self.create_board
    grid = Array.new(8) do
      Array.new(8)
    end
    Board.new(grid)
  end

  def populate_board
    [2,3,4,5].each do |row|
      [*0..7].each do |col|
        grid[row][col] = NullPiece.instance
      end
    end
    # #Pawns
      [*0..7].each do |col|
        grid[1][col] = Pawn.new([1, col], self, :green)
        grid[6][col] = Pawn.new([6, col], self, :blue)
      end

      [[0, :green] , [7, :blue]].each do |row, color|
        grid[row][0] = Rook.new([row, 0], self, color)
        grid[row][7] = Rook.new([row, 7], self, color)

        grid[row][1] = Knight.new([row, 1], self, color)
        grid[row][6] = Knight.new([row, 6], self, color)

        grid[row][1] = Knight.new([row, 1], self, color)
        grid[row][6] = Knight.new([row, 6], self, color)

        grid[row][2] = Bishop.new([row, 2], self, color)
        grid[row][5] = Bishop.new([row, 5], self, color)
      end

      grid[0][3] = Queen.new([0, 3], self, :green)
      grid[0][4] = King.new([0, 4], self, :green)

      grid[7][4] = Queen.new([7,4], self, :blue)
      grid[7][3] = King.new([7,3], self, :blue)


  end

  def move_piece(start_pos, end_pos)

    if self[start_pos].is_a?(NullPiece) || self[start_pos].nil?
      raise StandardError.new("No piece in start position")
    end
    unless valid_pos?(end_pos)
      raise "Cannot move piece here"
    end

    self[start_pos].pos = end_pos
    self[end_pos] = self[start_pos]
    # update the pieces position to the new position
    self[start_pos] = NullPiece.instance
  end

  def valid_pos?(pos)
    (0..7).include?(pos.first) && (0..7).include?(pos.last)
  end

  def [](pos)
    row,col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row,col = pos
    grid[row][col] = val
  end

  def in_check?(color)
    king = all_pieces.select { |piece| piece.color == color && piece.is_a?(King) }
    opponent_pieces = all_pieces.select { |piece| piece.color != color }

    opponent_pieces.any? do |piece|
      piece.moves.any? { |move| move == king.first.pos }
    end
  end

  def dup

  end

  def all_pieces
    all_pieces = []
    [*0..7].each do |row|
      [*0..7].each do |col|
        all_pieces << self[[row, col]] unless self[[row,col]].is_a?(NullPiece)
      end
    end
    all_pieces
  end

  def checkmate(color)
    if in_check?(color)
      player_pieces = all_pieces.select { |piece| piece.color == color }
      player_pieces.all? { |piece| piece.valid_moves.empty? }
    end
  end

end
