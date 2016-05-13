require_relative 'direction'

# Class MarsRover
class MarsRover
  attr_accessor :id, :dir

  # Constructor
  def initialize(index, x, y, face)
    @id = index
    @dir = Direction.new(x, y, face)
  end

  # Prints mars_rover current location
  def print_current_location
    puts [@dir.x_value, @dir.y_value, @dir.face].join(' ')
  end

  # Executes move on 'M' instruction
  def move
    @dir.move_forward
  end

  # Executes turn_right on 'R' instruction
  def rotate_right
    @dir.turn_right
  end

  # Executes turn_left on 'L' instruction
  def rotate_left
    @dir.turn_left
  end
end
