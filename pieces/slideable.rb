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
      poss_moves += new_move 
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
    loop do 
      x, y = pos
      pos = [x + dx, y + dy] 
      break unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      elsif board[pos].color != color
        moves << pos
    end 
    moves 
  end 

end 
