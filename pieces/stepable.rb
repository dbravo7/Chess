module Stepable

  def moves
    moves = []
    move_diffs.each do |pos_x, pos_y|
      x, y = pos 
      new_move = [x + pos_x, y + pos_y]
      if board[new_move].empty? || board[new_move].color != board[pos].color
        moves << new_move 
      end 
    end 
    moves 
  end 

  private

  def move_diffs 
    # implemented by subclass
    raise NoMethodError
  end 


end 