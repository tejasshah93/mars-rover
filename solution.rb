require_relative 'mars_rover'
require_relative 'mars_grid'

# Class Solution
class Solution
  attr_accessor :grid, :rover

  # Checks if input grid is valid or not
  def input_grid_valid?(mars_top_right_x, mars_top_right_y)
    # rubocop:disable RescueModifier
    result = Integer(mars_top_right_x) && Integer(mars_top_right_y) rescue false
    result
  end

  # Inputs grid coordinates from the user
  def take_grid_coordinates
    mars_top_right_x, mars_top_right_y = gets.chomp.split(' ')
    raise ArgumentError, 'Invalid mars_grid coordinates' unless \
      input_grid_valid?(mars_top_right_x, mars_top_right_y)
    @grid = MarsGrid.new(mars_top_right_x.to_i, mars_top_right_y.to_i)
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  # Processes rover inputs and executes commands given to the rover
  def process_rovers
    # Processes 2 lines at a time
    STDIN.each_slice(2).each_with_index do |lines, index|
      rover_x, rover_y, rover_face = lines[0].split

      # Checks if the rover coordinates are valid according to grid config
      unless @grid.valid?(rover_x.to_i, rover_y.to_i, rover_face.to_s)
        puts 'Invalid mars_rover co-ordinates/heading: ' \
             "(#{rover_x}, #{rover_y}, #{rover_face})"
        next
      end

      # Creates new rover
      @rover = MarsRover.new(index, rover_x.to_i, rover_y.to_i, rover_face.to_s)

      # puts "Instructions: #{lines[1].chomp}"
      catch :invalid_instruction do
        # Executes each instruction sequentially
        lines[1].chomp.each_char do |instruction|
          throw :invalid_instruction unless process_instruction(instruction)
        end
      end

      # If rover instruction is invalid
      next unless @rover.id != -1
      @rover.print_current_location
    end
  end

  # Execute the instruction passed
  def process_instruction(instruction)
    case instruction
    when 'L'
      @rover.rotate_left
    when 'M'
      @rover.move
    when 'R'
      @rover.rotate_right
    else
      puts "Error: Invalid instruction '#{instruction}'. " \
           'Allowed instructions: L, M, R'
      # Invalidate rover if instruction is not valid
      @rover.id = -1
      return false
    end
  end
end

# Main: Executes the program
if __FILE__ == $PROGRAM_NAME
  solution = Solution.new
  solution.take_grid_coordinates
  solution.process_rovers
end
