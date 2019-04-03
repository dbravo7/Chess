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
    
  end 

  private 

  def move_dirs
    #overwritten by subclass
    raise NoMethodError 
  end 

  def grow_unblocked_moves_in_dir(dx, dy)

  end 

end 
