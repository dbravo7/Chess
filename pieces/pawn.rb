require_relative "piece"
class Pawn < Piece

  def symbol
     "p".colorize(color)
  end 

  def move_dirs
    
  end 

  private 
  
  def forward_dir
    # returns 1 or -1 
  end 

  def forward_steps 

  end 

  def side_attacks

  end 

end 