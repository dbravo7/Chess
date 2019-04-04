class HumanPlayer

  attr_reader :color, :display 

  def initialize(color, display)
    @color = color
    @display = display
  end 

  def make_move(board) 
    start_pos = @display.cursor_pos  
    end_pos = @display.cursor_pos  
    [start_pos, end_pos] 
  end 

end 