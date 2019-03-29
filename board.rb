require "byebug"
require_relative "piece"

class Board

  def initialize 
    @board = board 
    debugger 
  end 

  def board 
    Array.new(7) do 
      Array.new(7) {Piece.new(nil)}
    end   
  end 

end 

if $PROGRAM_NAME == __FILE__
  Board.new 
end 