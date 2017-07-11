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
        grid[row][col] = NullPiece.new([row, col], self)
      end
    end
    [0,1].each do |row|
      [*0..7].each do |col|
        grid[row][col] = Piece.new([row, col], self, :green)
      end
    end
    [6,7].each do |row|
      [*0..7].each do |col|
        grid[row][col] = Piece.new([row, col], self, :blue)
      end
    end
    # grid[0][0] = King.new([0,0], self)
  end

  def move_piece(start_pos, end_pos)

    if self[start_pos].is_a?(NullPiece) || self[start_pos].nil?
      raise StandardError.new("No piece in start position")
    end
    unless valid_pos?(end_pos)
      raise "Cannot move piece here"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new(start_pos, self)
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

end
