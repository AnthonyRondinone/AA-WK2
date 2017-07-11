require 'colorize'
require_relative 'cursor'


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
          print " #{piece}".red
        else
          print " #{piece}"
        end
      end
      puts "\n"
    end
  end
end
