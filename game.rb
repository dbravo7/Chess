require 'byebug'
require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game

  attr_reader :board, :display, :players

  def initialize
    @board = Board.new 
    @display = Display.new(@board)
    @players = [HumanPlayer.new(:white, display), HumanPlayer.new(:black, display)] 
    play 
  end 

  def play
    until @board.checkmate?(players.first.color)
      display.render 
      # prompt 
      move_piece 
      swap_turn
    end 
    display.render 
    puts "Game Over"
  end 

  def move_piece
    begin
      start_pos, end_pos = players.first.make_move(board) 
      board.move_piece(players.first.color, start_pos, end_pos)
    rescue ArgumentError => e
      puts "Please choose another position"
      puts "#{e.message}"
      sleep(1.5)
    retry 
    end 
  end 

  private 

  # def prompt
  #   puts "#{players.first.color}'s move"
  #   sleep(1.5)
  # end 

  def swap_turn
    # All game methods call on the firs ele in the arr for the next move 
   players[0], players[1] = players[1], players[0]
  end 
end 

if $PROGRAM_NAME == __FILE__
 Game.new 
end 