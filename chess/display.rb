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
          print " #{piece} ".colorize(piece.color).colorize(:background => :red)
        else
          if (i.even? && j.even?) || (i.odd? && j.odd?)
            print " #{piece} ".colorize(piece.color).colorize(:background => :light_black)
          else
            print " #{piece} ".colorize(piece.color).colorize(:background => :white)
          end
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
  puts board.in_check?(:green)
  board.move_piece([0,4],[5,4])
  puts board.in_check?(:green)
  # p board[[1,1]].moves
  # board.move_piece([1,1], [2,1])
  # p board[[2,1]].moves
  # board.move_piece([2,1], [3,1])
  # p board[[3,1]].moves

end
