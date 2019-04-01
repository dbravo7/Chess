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
    
    @board.each_with_index do |subArr, row|
        rendered = []
      subArr.each_with_index do |piece, y|
        if @cursor.cursor_pos == piece.position && @cursor.selected == false 
          rendered << piece.piece.to_s.colorize(:background=>:light_blue) 
        elsif @cursor.cursor_pos == piece.position && @cursor.selected == true 
            rendered << piece.piece.to_s.colorize(:background=>:light_red)   
        elsif row.even? && y.odd? || row.odd? && y.even? 
          rendered << piece.piece.to_s.colorize(:background=>:light_black)
        else
          rendered << piece.piece.to_s
        end 
        end 
          puts rendered.join(" ")
    end 
    debugger 
    test_loop
  end 

  def test_loop
    @cursor.get_input 
    render 
  end 
end 