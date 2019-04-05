require_relative "piece"
require_relative "slideable"

class Rook < Piece
  include Slideable 

  def symbol
    color == :white ? "♖" : "♜"
  end 

  protected

  def move_dirs
    horizontal_vertical_directions
  end 
end 