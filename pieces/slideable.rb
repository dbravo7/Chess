module Slideable
  HORIZONTAL_AND_VERTICAL_DIRS = [
   [0,1],
   [0,-1],
   [-1,0],
   [1,0]
  ]   

  DIAGONAL_DIRS = [
   [1,1],
   [-1,-1],
   [1,-1],
   [-1,1]
  ]

  def horizontal_vertical_directions
    HORIZONTAL_AND_VERTICAL_DIRS
  end 

  def diagonal_dirs
    DIAGONAL_DIRS
  end 

  def moves
    x, y = pos 
    poss_moves = []
    move_dirs.each do |dx, dy|
      new_move = grow_unblocked_moves_in_dir(dx, dy)
      # if new_move
        poss_moves += new_move 
      # end 
    end 
    poss_moves
  end 

  private 

  def move_dirs
    #overwritten by subclass
    raise NoMethodError 
  end 

  def grow_unblocked_moves_in_dir(dx, dy)
    moves = []
    move = self.pos
    loop do 
      x, y = move 
      move = [x + dx, y + dy] 
      break unless board.valid_pos?(move) && board[move].color != color

      if board.empty?(move)
        moves << move
      elsif board[move].color != color
        moves << move
        break 
      end 
    end 
    moves 
  end 

end 
