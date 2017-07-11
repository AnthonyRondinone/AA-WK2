require_relative 'pieces.rb'
require_relative 'display.rb'
require 'byebug'

class Board

  attr_accessor :grid
  attr_reader :display

  def self.empty_grid
    Array.new(8) do
      Array.new(8) { NullPiece.new }
    end
  end

  def initialize(grid = Board.populate_board)
    @grid = grid
    @display = Display.new(self)

  end

  def self.populate_board
    grid = Board.empty_grid
    [0,1,6,7].each do |row|
      [*0..7].each do |col|
        grid[row][col] = Piece.new
      end
    end
    grid
  end

  def move_piece(start_pos, end_pos)

    if self[start_pos].is_a? NullPiece || self[start_pos].nil?
      raise StandardError.new("No piece in start position")
    end
    unless valid_pos?(end_pos)
      raise "Cannot move piece here"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def valid_pos?(pos)
    (0..7).include?(pos.first) && (0..7).include?(pos.last)
  end

  def run
    while true
      display.render
      display.cursor.get_input
      system("clear")
    end
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

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.run
end
