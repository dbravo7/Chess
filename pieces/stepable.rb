module Stepable

  def moves
    moves = []
    self.move_diff.each do |pos_x, pos_y|
      x, y = pos 
      new_move = [x + pos_x, y + pos_y]
      if board.valid_pos?(new_move) && 
        (board[new_move].empty? || board[new_move].color != board[pos].color)
        moves << new_move 
      end 
    end 
    moves 
  end 

  private

  def move_diff
    # implemented by subclass
    raise NoMethodError
  end 


end 