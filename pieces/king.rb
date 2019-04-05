require_relative "piece"
require_relative "stepable"

class King < Piece 
  include Stepable

  def symbol
    color == :white ? "♔" : "♚"
  end
  
  protected

  def move_diff
    [
     [0, 1],
     [0,-1],
     [-1,0],
     [1,0],
     [1,1],
     [-1,-1],
     [1,-1],
     [-1,1]
    ]
  end 
end 