class Piece
 
attr_reader :color, :position, :board 

  def initialize(color, board, position)
    @board = board
    @color = color #symbol 
    @position = position
  end 

  def []=(pos, val)
    x, y = pos 
    @board[x][y] = val 
  end 

  

  def to_s
    "#{@color}"
  end 

  def empty? 

  end 

  def moves 
    # should return an array of places a Piece can move to 
    # Pieces move differently so will have to implement with subclasses
  end 

end 