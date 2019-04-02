require "byebug"
require_relative "pieces"
require_relative "display"

class Board

  attr_reader :board, :display 

  def initialize 
    @board = board
    @sentinel = NullPiece.instance 
    populate_grid(@board)
    @display = Display.new(@board)
    # move_piece([0,0],[4,2])
    display_test_loop
  end 

  def display_test_loop
    display.render
  end 

  def [](pos)
    x, y = pos
    @board[x][y]
  end 

  def []=(pos, value) 
    x, y = pos
    @board[x][y] = value 
    self[pos].position = pos  
  end 

  def board 
    board = Array.new(8) {Array.new(8, sentinel)}
  end 

  def populate_grid(board)
    board.each_with_index do |subArr, row|
     board.each_with_index do |ele, col|
        if row <= 1 || row >= 6
          board[row][col] = Piece.new([row, col], @board.dup) 
        end
      end 
    end 
    board 
  end 

  def valid_move(start, end_pos)
    if self[start].is_a?(NullPiece)  
      raise "There is no piece at this start position" 
    elsif !self[end_pos].is_a?(NullPiece)
      raise "The end_pos is already occupied by a piece"
    end 
  end 

  def move_piece(start_pos, end_pos)
    begin 
      valid_move(start_pos, end_pos) 
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    rescue ArgumentError
      puts "Please input new coordinates"
      retry 
    end
  end 
 

end 

if $PROGRAM_NAME == __FILE__
  Board.new 
end 