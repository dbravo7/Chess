require_relative "piece"
require_relative "slideable"

class Bishop

  def symbol
    "♗".colorize(color)
  end 

  protected

  def move_dirs
    diagonal_dirs
  end 
end 