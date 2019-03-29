


class Piece
 
attr_reader :piece 

  def initialize(piece=nil)
    @piece = piece 
  end 


end 

class NullPiece < Piece

  def initialize 

  end 
end 