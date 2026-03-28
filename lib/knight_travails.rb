require 'pry-byebug'
require_relative 'knight'

class Travails < Knight

  def initialize
    @queue_of_knights = []
  end

  def knight_moves(start, goal)
    @queue_of_knights << Knight.new(start, goal)
    vertices = @queue_of_knights[0].travail
    until @goal_reached
      vertices.each do |x, y|
        next_knight = Knight.new([x, y], goal, @queue_of_knights[0].previous)
        @queue_of_knights << next_knight
      end
      @queue_of_knights.shift
      vertices = @queue_of_knights[0].travail
      if vertices == true
        @goal_reached = true
        @queue_of_knights[0].previous << goal
      end
    end
    moves = @queue_of_knights[0].previous.length - 1
    puts "You made it in #{moves} moves"
    puts "Here's your path:"
    @queue_of_knights[0].previous.each do |x, y|
      print "[#{x}, #{y}]\n"
    end
    @queue_of_knights[0].previous
  end

end