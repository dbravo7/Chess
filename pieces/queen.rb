require_relative 'piece'
require_relative 'slideable'

class Queen 

  def symbol
    "♕".colorize(color)
  end 

  protected

  def move_dirs
    horizontal_vertical_directions
    diagonal_dirs
  end 
end 