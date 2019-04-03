require_relative "piece"
require_relative "stepable"

class Knight 

  def symbol
    "♘".colorize(color)
  end 

  protected
  
  def move_diff
    [
     [-1,-2],
     [1,-2],
     [-2,-1],
     [-2,1],
     [-1,2],
     [1,2],
     [2,-1],
     [2,1]
    ]
  end 

end 
