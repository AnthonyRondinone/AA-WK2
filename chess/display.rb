require 'colorize'
require_relative 'cursor'
require_relative 'board'


class Display
  attr_reader :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if cursor.cursor_pos == [i, j]
          print " #{piece}".colorize(piece.color).colorize(:background => :red)
        else
          print " #{piece}".colorize(piece.color).colorize(:background => :light_black)
        end
      end
      puts "\n"
    end
  end

  def run
    while true
      render
      cursor.get_input
      system("clear")
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.create_board
  display = Display.new(board)
  # display.run

  p board[[1,1]].moves
  board.move_piece([1,1], [2,1])
  p board[[2,1]].moves
end
