require_relative "piece"
require_relative "stepable"

class King
  include Stepable

  def symbol
    "/u2654".colorize(color)
  end
  
  protected

  def move_diffs
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