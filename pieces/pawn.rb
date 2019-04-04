require_relative "piece"
class Pawn < Piece

  def symbol
     "♙".colorize(color).bold 
  end 

  def moves
    forward_steps + side_attacks
  end 

  private 
  
  def at_start_row?
    pos[0] == (color == :white) ? 6 : 1
  end 

  def forward_dir
    color == :white ? -1 : 1 
  end 

  def forward_steps 
    steps = []
    x, y = pos 
    single_step = [x + forward_dir, y]
    if board.empty?(single_step)
      steps << single_step
    end 
    two_steps [x + (2 * forward_dir), y]
    if at_start_row? && board.empty?(two_steps)
      steps << two_steps
    end 
    steps 
  end 

  def side_attacks
    attacks = []
    x, y = pos 
    side_one = [x + forward_dir, y + 1]
    side_two = [x + forward_dir, y - 1]
    if !board.empty?(side_one) && @board[side_one].color != self.color 
      attacks << side_one
    end 

    if !board.empty?(side_two) && @board[side_two].color != self.color 
      attacks << side_two
    end 
    attacks
  end 

end 