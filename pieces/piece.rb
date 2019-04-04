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
    moves.select {|end_pos| move_into_check?(end_pos)}
  end 

  private

  def move_into_check?(end_pos)
    board_dup = board.board_dup  
    
    board_dup[end_pos] = self 
    board_dup.in_check?(color)
  end 

end 