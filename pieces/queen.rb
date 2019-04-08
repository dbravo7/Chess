require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable 

  def symbol
    color == :white ? "♕" : "♛"
  end 

  protected

  def move_dirs
    horizontal_vertical_directions + diagonal_dirs
  end 
end 