require_relative "piece"
require_relative "slideable"

class Rook 

  def symbol
    "♖".colorize(color)
  end 

  protected

  def move_dirs
    horizontal_vertical_directions
  end 
end 