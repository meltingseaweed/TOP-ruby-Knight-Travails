require 'pry-byebug'

# module KnightTravails

  class Knight

    attr_reader :start, :previous

    def initialize(start = [0,0], goal = [7,7], previous = [])
      @start = start
      @goal = goal
      @new_positions = []
      @possible_positions = []
      @previous = previous.dup
      @goal_reached = false
    end

    def add_previous(vertex)
      @previous << vertex
    end

    def travail
      @new_positions = []
      @possible_positions = []
      movement_array = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1], [-1,2]]
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
      add_previous(@start)
      binding.pry
      return true if goal?
      @new_positions
    end

    def goal?
      @new_positions.include?(@goal)
    end

  end
# end