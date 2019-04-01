
class Piece
 
attr_reader :piece 

  def initialize(piece=nil)
    @piece = piece 
  end 


end 

class NullPiece < Piece

  attr_reader :null_piece

  def initialize(value=nil)
    @null_piece = value
  end 
end 