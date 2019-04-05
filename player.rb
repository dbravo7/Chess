require_relative "display"

class HumanPlayer

  attr_reader :color, :display 

  def initialize(color, display)
    @color = color
    @display = display
  end 

  def make_move(board) 
    start_pos = nil
    end_pos = nil
    until start_pos && end_pos
      display.render
      puts "#{color}'s turn" 
      puts display.puts_debug(start_pos)
      if !start_pos
        puts "Choose the piece you would like to move"
        start_pos = @display.cursor.get_input  
      elsif !end_pos
        puts "Choose where you would like to move the piece" 
        end_pos = @display.cursor.get_input  
      end 
    end 
    # debugger 
    [start_pos, end_pos]  
  end 

end 