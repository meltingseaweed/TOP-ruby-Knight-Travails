require 'pry-byebug'
require_relative 'knight'

class Travails < Knight

  # Initialize an array that will contain all of the knight objects?
  def initialize
    @queue_of_knights = []
  end

    # How can I edit this so it adds objects to the class queue?
    def knight_moves(start, goal)
      binding.pry
      @queue_of_knights << Knight.new(start, goal)
      vertices = @queue_of_knights[0].travail
      until @goal_reached
        binding.pry
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
      puts "Here's your path:"
      @queue_of_knights[0].previous.each do |x, y|
        print "[#{x}, #{y}]\n"
      end
      @queue_of_knights[0].previous
    end

end
# Create a knight class with a start and goal. 
# Run travails. 
# Loop until the goal is reached.
