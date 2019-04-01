require 'byebug'
require 'colorize'
require_relative "cursor"

class Display 

attr_reader :cursor 

  def initialize 
    @cursor = Cursor.new([0,0], board)


end 