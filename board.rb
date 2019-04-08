require "byebug"
require_relative "pieces"

class Board

  attr_reader :board

  def initialize 
    @sentinel = NullPiece.instance 
    @board = grid
    populate_grid(@board)
  end 

  def pieces
    @board.flatten.reject(&:empty?)
  end 

  def [](pos)
    x, y = pos
    @board[x][y]
  end 

  def []=(pos, value) 
    x, y = pos
    @board[x][y] = value 
  end 

  def empty?(pos)
    self[pos].empty? 
  end 

  def grid 
    board = Array.new(8) {Array.new(8, @sentinel)} 
  end 

  def add_piece(piece, pos)
    # debugger 
    self[pos] = piece
  end 

  def populate_grid(grid)
    grid.each_with_index do |subArr, row|
     subArr.each_with_index do |ele, col|
        if row == 1 
          Pawn.new(:white, self, [row, col])
        elsif row == 6
          Pawn.new(:black, self, [row, col])
        elsif row == 0 || row == 7
          non_pawn_pieces([row,col]) 
        end
      end 
    end 
    # debugger 
    @board 
  end 

  def valid_pos?(end_pos)
    x, y = end_pos 
    x.between?(0, 7) && y.between?(0, 7)
  end 
  
  def non_pawn_pieces(pos)
    color = (pos.first == 0) ? :white : :black 
    if pos.last == 7 || pos.last == 0
      return Rook.new(color, self, pos)
    elsif pos.last == 6 || pos.last == 1
      return Knight.new(color, self, pos)
    elsif pos.last == 5 || pos.last == 2
      return Bishop.new(color, self, pos)
    elsif pos.last == 3 
      return King.new(color, self, pos)
    elsif pos.last == 4
      return Queen.new(color, self, pos)
    end 
  end 

  def move_piece(color, start_pos, end_pos)
    piece = self[start_pos]
      if piece.is_a?(NullPiece)
        raise ArgumentError.new "There is no piece at this position"
      elsif piece.color != color
        raise ArgumentError.new "This is not your piece"
      elsif self[end_pos].color == color
        raise ArgumentError.new "One of your own pieces is occupying this position"
      elsif piece.valid_moves.empty? 
        raise ArgumentError.new "There are no valid moves for this piece"
      elsif !piece.valid_moves.include?(end_pos)
        raise ArgumentError.new "Not a valid move for this piece"
      end   
    move_piece!(start_pos, end_pos)
  end 

  def move_piece!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos 
    self[start_pos] = @sentinel 
  end 

  def in_check?(color)
    king_pos = find_king(color)
    pieces.any? do |p|
      if p.color != color && p.moves.include?(king_pos) 
        return true
      end 
    end 
    false 
  end 

  def find_king(color)
    pieces.find do |p|
      if p.is_a?(King) && p.color == color
        return p.pos
      end 
    end
    raise "No king was found" 
  end 

  def checkmate?(color)
    if !in_check?(color)
      return false 
    end 
    king_piece_pos = find_king(color)
    self[king_piece_pos].moves.each do |pos|
      pieces.any? do |p| 
       if p.color != color && !p.valid_moves.include?(pos) 
        return false
       end 
      end 
    end 
    true 
  end 

  def board_dup
    test_board = Board.new
    
    pieces.each do |p|
      p.class.new(p.color, test_board, p.pos)
    end 
    test_board
  end 

  private

  attr_reader :sentinel

end 

if $PROGRAM_NAME == __FILE__
  Board.new 
end 