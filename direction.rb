# Class Direction
class Direction
  attr_accessor :x_value, :y_value, :face

  north = {
    'L' => 'W',
    'R' => 'E'
  }

  south = {
    'L' => 'E',
    'R' => 'W'
  }

  east = {
    'L' => 'N',
    'R' => 'S'
  }

  west = {
    'L' => 'S',
    'R' => 'N'
  }

  # rubocop:disable ClassVars
  # direction_hash maps rotate instruction result
  @@direction_hash = {
    'N' => north,
    'S' => south,
    'E' => east,
    'W' => west
  }

  # axis_hash gives the axis of current facing
  @@axis_hash = {
    'N' => 'Y',
    'S' => 'Y',
    'E' => 'X',
    'W' => 'X'
  }

  # value_hash informs is current facing is in +ve / -ve direction
  @@value_hash = {
    'N' => 1,
    'S' => -1,
    'E' => 1,
    'W' => -1
  }

  # Constructor
  def initialize(x, y, face)
    @x_value = x
    @y_value = y
    @face = face
  end

  # Execute turn_left
  def turn_left
    @face = @@direction_hash[@face]['L']
  end

  # Execute turn_right
  def turn_right
    @face = @@direction_hash[@face]['R']
  end

  # Execute move step based on axis_hash and value_hash
  def move_forward
    if @@axis_hash[@face] == 'X'
      @x_value += @@value_hash[@face]
    elsif @@axis_hash[@face] == 'Y'
      @y_value += @@value_hash[@face]
    end
  end
end
