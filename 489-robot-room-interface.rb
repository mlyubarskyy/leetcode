# This is the robot's control interface.
# You should not implement it, or speculate about its implementation
# class Robot
#    def move():
#        Returns true if the cell in front is open and robot moves into the cell.
#        Returns false if the cell in front is blocked and robot stays in the current cell.
#    end
#
#    def turnLeft():
#        Robot will stay in the same cell after calling turnLeft/turnRight.
#        Each turn will be 90 degrees.
#    end
#
#    def turnRight():
#        Robot will stay in the same cell after calling turnLeft/turnRight.
#        Each turn will be 90 degrees.
#    end
#
#    def clean():
#        Clean the current cell.
#    end
# end

class Mover
  DIRECTIONS = [[-1, 0], [0, 1], [1, 0], [0, -1]].freeze

  def initialize robot
    @robot = robot
    @visited = Set.new
  end

  def go_back
    @robot.turnRight
    @robot.turnRight
    @robot.move
    @robot.turnRight
    @robot.turnRight
  end

  def backtrack cell = [0, 0], d = 0
    puts [:visiting, cell].inspect
    @visited.add(cell)
    @robot.clean

    # going clockwise : 0: 'up', 1: 'right', 2: 'down', 3: 'left'
    4.times do |i|
      new_d = (d + i) % 4
      new_cell = [
        cell[0] + DIRECTIONS[new_d][0],
        cell[1] + DIRECTIONS[new_d][1]
      ]

      if !@visited.include?(new_cell) && @robot.move
        backtrack(new_cell, new_d)
        go_back
      end
      @robot.turnRight
    end
  end
end

# @param {Robot} robot
# @return {}
def cleanRoom(robot)
	Mover.new(robot).backtrack
end
