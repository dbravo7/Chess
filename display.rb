require 'byebug'
require 'colorize'
require_relative "cursor"

class Display 

attr_reader :cursor, :board 

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

  def puts_debug(pos, color)
    if @show_debug && pos 
      puts "Available moves: #{num_lett_conversion(board[pos].valid_moves)}"
    else 
      puts "In Check? #{board.in_check?(color)}"
    end 
  end 

  def num_lett_conversion(arr)
    lett = {
      0=>"h",
      1=>"g",
      2=>"f",
      3=>"e",
      4=>"d",
      5=>"c",
      6=>"b",
      7=>"a"
    }
    new_arr = []
    arr.each_with_index do |coord, idx|
      coord[0] += 1 
      coord[1] = lett[coord[1]]
      new_arr << arr[idx].join("")
    end
    new_arr.join(" ")
  end 

  def render 
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    @board.board.each_with_index do |subArr, x|
        rendered = []
      subArr.each_with_index do |piece, y| 
        if @cursor.cursor_pos == [x, y] && @cursor.selected == false 
          rendered << @board.board[x][y].to_s.colorize(:background=>:light_blue) 
        elsif @cursor.cursor_pos == [x, y] && @cursor.selected == true 
          rendered << @board.board[x][y].to_s.colorize(:background=>:light_red)   
        elsif x.even? && y.odd? || x.odd? && y.even? 
          rendered << piece.to_s.colorize(:background=>:grey)
        else
          rendered << piece.to_s.colorize(:background=>:white)
        end 
        end 
      puts "#{x + 1}".colorize(:cyan) + "|" + rendered.join("")
    end 
    puts "   #{("a".."h").to_a.join("  ").reverse}".colorize(:cyan)
    puts ""
  end 

end 