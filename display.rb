require 'byebug'
require 'colorize'
require_relative "cursor"

class Display 

attr_reader :cursor_pos, :board 

  def initialize(board) 
    @cursor = Cursor.new([0,0], board)
    @board = board
    @show_debug = true  
  end 

  def cursor_pos
    @cursor.get_input 
  end 

  def toggle_debug
    @show_debug == false ? true : false 
  end 

  def puts_debug
    pos = @cursor.cursor_pos
    if @show_debug
      puts "Available moves:#{board[pos].moves}"
      puts "Check? #{board.in_check?(@cursor.cursor_pos.color)}"
    end 
  end 

  def render 
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    @board.board.each_with_index do |subArr, x|
        rendered = []
      subArr.each_with_index do |piece, y|
        if @cursor.cursor_pos == [x, y] && @cursor.selected == false 
          rendered << board.board[x][y].to_s.colorize(:background=>:light_blue) 
        elsif @cursor.cursor_pos == [x, y] && @cursor.selected == true 
          rendered << board.board[x][y].to_s.colorize(:background=>:light_red)   
        elsif x.even? && y.odd? || x.odd? && y.even? 
          rendered << piece.to_s.colorize(:background=>:light_green)
        else
          rendered << piece.to_s.colorize(:background=>:light_yellow)
        end 
        end 
      puts "#{x + 1}".colorize(:cyan) + "|" + rendered.join("")
    end 
    puts "   #{("a".."h").to_a.join("  ").reverse}".colorize(:cyan)
    puts ""
    puts_debug
  end 

end 