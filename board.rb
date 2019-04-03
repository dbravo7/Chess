require "byebug"
require_relative "pieces"
require_relative "display"

class Board

  attr_reader :board, :display 

  def initialize 
    @sentinel = NullPiece.instance 
    @board = board
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

  def empty?(pos)
    self[pos].empty? 
  end 

  def board 
    board = Array.new(8) {Array.new(8, @sentinel)} 
  end 

  def populate_grid(board)
    board.each_with_index do |subArr, row|
     board.each_with_index do |ele, col|
        if row <= 1 || row >= 6
          board[row][col] = Piece.new(self, [row, col]) 
        end
      end 
    end 
    board 
  end 

  def valid_pos?(end_pos)
    x, y = end_pos 
    x.between?(0,7) && y.between?(0,7)
  end 
  
  def add_piece(piece, pos)

  end 

  def move_piece(color, start_pos, end_pos)
    begin 
      @display.get_input 
      if self[start_pos].is_a?(NullPiece)
        raise "There is no piece at this position"
      elsif self[start_pos].color != color
        raise "This is not your piece"
      elsif self[end_pos].color == color
        raise "One of your own pieces is occupying this position"
      end   
      !move_piece(color, start_pos, end_pos)
    rescue ArgumentError
      puts "Please choose a different position"
      retry 
    end
  end 

  def !move_piece(color, start_pos, end_pos)
    end_pos = start_pos
    start_pos = @sentinel 
  end 

  private

  attr_reader :sentinel

end 

if $PROGRAM_NAME == __FILE__
  Board.new 
end 