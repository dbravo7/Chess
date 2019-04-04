require 'byebug'
require_relative 'board'

class Game

  attr_reader :board, :display, :players

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = [HumanPlayer.new(:white, display), HumanPlayer.new(:black, display)]
  end 

  def play
    until board.checkmate?
      prompt 
      players.first.make_move(@board) 
      swap_turn
    end 
    puts "Game Over"
  end 

  def move_piece
    begin
      board.move_piece
    rescue ArgumentError 
      puts "Please choose another position"
    retry 
    end 
  end 

  private 

  def prompt
    puts "#{players.first.color}'s move"
    sleep(1.5)
  end 

  def swap_turn
    # All game methods call on the firs ele in the arr for the next move 
   players.first, players.last = players.last, players.first
  end 
end 