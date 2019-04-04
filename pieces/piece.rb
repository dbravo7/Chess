class Piece
 
attr_reader :color, :pos, :board 

  def initialize(color, board, pos)
    @board = board
    @color = color 
    @pos = pos
  end 

  def []=(pos, val)
    x, y = pos
    board[pos] = val 
  end 

  def to_s
    " #{symbol} "
  end 

  def empty? 
    false 
  end 
  
  def symbol
    # subclass implements this method
    raise NotImplementedError 
  end 

  def valid_moves 
    move_dirs 
    # should return an array of places a Piece can move to 
    # Pieces move differently so will have to implement with subclasses
  end 

  private

  def move_into_check?(end_pos)

  end 

end 