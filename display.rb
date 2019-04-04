require 'byebug'
require 'colorize'
require_relative "cursor"

class Display 

attr_reader :cursor_pos, :board 

  def initialize(board) 
    @cursor = Cursor.new([0,0], board)
    @board = board
  end 

  def render 
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    @board.each_with_index do |subArr, x|
        rendered = []
      subArr.each_with_index do |piece, y|
        if @cursor.cursor_pos == [x, y] && @cursor.selected == false 
          rendered << board[x][y].to_s.colorize(:background=>:light_blue) 
        elsif @cursor.cursor_pos == [x, y] && @cursor.selected == true 
          rendered << board[x][y].to_s.colorize(:background=>:light_red)   
        elsif x.even? && y.odd? || x.odd? && y.even? 
          rendered << piece.to_s.colorize(:background=>:light_green)
        else
          rendered << piece.to_s.colorize(:background=>:light_yellow)
        end 
        end 
      puts "#{x + 1}".colorize(:cyan) + "|" + rendered.join("")
    end 
    puts "   #{("a".."h").to_a.join("  ").reverse}".colorize(:cyan)
    test_loop
  end 

  def test_loop
    @cursor.get_input 
    render 
  end 
end 