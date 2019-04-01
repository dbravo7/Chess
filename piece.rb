require 'colorize'
require_relative "cursor"
class Piece
 
attr_reader :piece, :position

  def initialize(piece=nil, position)
    @piece = piece 
    @position = position
  end 

  def move_position(pos) 
    @position = pos
  end 

end 

class NullPiece < Piece

  attr_reader :piece 

  def initialize(piece=nil, position)
    @piece = piece 
    @position = position 
  end 
end 