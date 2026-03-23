require 'pry-byebug'

# module KnightTravails

  class Knight

    attr_reader :new_positions, :possible_positions, :previous, :start

    def initialize(start = [0,0], goal = [7,7], previous = [])
      @start = start
      @goal = goal
      @new_positions = []
      @possible_positions = []
      @previous = [previous]
      @goal_reached = false
    end

    def travail
      @new_positions = []
      @possible_positions = []
      movement_array = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1], [-1,1]]
      movement_array.each do |x, y|
        @possible_positions << [@start[0] + x, @start[1] + y]
      end
      @possible_positions.each do |x, y|
        if x.between?(0,7) && y.between?(0,7)
          @new_positions << [x, y]
        end
      end
      @previous.each do |x, y|
        @new_positions.delete([x, y])
      end
      return true if goal?
      @new_positions
    end

    def goal?
      @new_positions.include?(@goal)
    end

    def knight_moves(start, goal)
      knight_one = Knight.new(start, goal)
      next_routes = knight_one.travail
      @my_previous = [start]
      until @goal_reached
        binding.pry
        knight = Knight.new(next_routes[0], goal, @my_previous)
        next_routes << knight.travail
        @my_previous << next_routes.shift
        if knight.travail == true
          @goal_reached = true
          @previous << goal
        end
      end
      puts "Here's your path:"
      @previous.each do |x, y|
        print "[#{x}, #{y}]\n"
      end
    end
  end
# end