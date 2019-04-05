class Piece
 
attr_reader :color, :pos, :board 

  def initialize(color, board, pos)
    @board = board
    @color = color 
    @pos = pos

    board.add_piece(self, pos) 
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
    x, y = end_pos
    test_board = board.board_dup  
    debugger 
    test_board.move_piece!(self.pos, end_pos) 
    test_board.in_check?(color)
  end 

end 