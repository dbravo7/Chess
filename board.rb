require "byebug"
require_relative "piece"

class Board

  def initialize 
    @board = board
    populate_grid(@board)
    debugger 
  end 

  def [](pos)
    x, y = pos
    @board[x][y]
  end 

  def []=(pos, value) 
    @board[pos] = value 
  end 

  def board 
    board = Array.new(8) {Array.new(8)}
  end 

  def populate_grid(board)
    board.each_with_index do |subArr, row|
     board.each_with_index do |ele, col|
        if row <= 1 || row >= 6
          board[row][col] = Piece.new 
        else
          board[row][col] = NullPiece.new 
        end
      end 
    end 
    board 
  end 
  def valid_move(start, end_pos)
    if self[start].is_a?(NullPiece)
      raise "There is no piece at this start position" 
    elsif self[end_pos].is_a?(Piece)
      raise "The end_pos is already occupied by a piece"
    end 
  end 

  def move_piece(start_pos, end_pos)
    begin 
      valid_move(start_pos, end_pos) 
      self[end_pos] = self[start_pos] 
    rescue ArgumentError
      puts "Please input new coordinates"
      debugger 
      retry 
    end
 #This should update the 2D grid and also the moved piece's position. 
 #You'll want to raise an exception if:

#there is no piece at start_pos or
#the piece cannot move to end_pos.
  end 

end 

if $PROGRAM_NAME == __FILE__
  Board.new 
end 