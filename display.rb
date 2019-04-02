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
    @board.each_with_index do |subArr, row|
        rendered = []
      subArr.each_with_index do |piece, y|
        if @cursor.cursor_pos == piece.position && @cursor.selected == false 
          rendered << piece.piece.to_s.colorize(:background=>:light_blue) 
        elsif @cursor.cursor_pos == piece.position && @cursor.selected == true 
            rendered << piece.piece.to_s.colorize(:background=>:light_red)   
        elsif row.even? && y.odd? || row.odd? && y.even? 
          rendered << piece.piece.to_s.colorize(:background=>:light_green)
        else
          rendered << piece.piece.to_s(:background=>:light_yellow)
        end 
        end 
      puts "#{row + 1}".colorize(:cyan) + "|" + rendered.join(" ")
    end 
    puts "  #{("a".."h").to_a.join(" ").reverse}".colorize(:cyan)
    test_loop
  end 

  def test_loop
    @cursor.get_input 
    render 
  end 
end 