# spec/solution_spec.rb

require_relative 'spec_helper'

describe Solution do
  before :all do
    @solution = Solution.new
  end

  describe '#new' do
    it 'should return a new solution object' do
      expect(@solution).to be_a Solution
    end

    it 'should not return nil' do
      expect(@solution).not_to be_nil
    end
  end

  describe '#input_grid_valid' do
    it 'should return true for valid input grid coordinates' do
      expect(@solution.input_grid_valid?(5, 5)).to be_truthy
    end

    it 'should return false for invalid  input grid coordinates' do
      expect(@solution.input_grid_valid?('a', 5)).to be_falsey
    end
  end

  describe '#take_grid_coordinates' do
    it 'should take input grid and create MarsGrid object' do
      allow(@solution).to receive(:gets).and_return('5 5')
      @solution.take_grid_coordinates
      expect(@solution.grid.top_right_x).to eq(5)
      expect(@solution.grid.top_right_y).to eq(5)
    end

    it 'should raise ArgumentError on invalid grip input' do
      allow(@solution).to receive(:gets).and_return('a 5')
      expect { @solution.take_grid_coordinates }.to raise_error(ArgumentError)
    end
  end

  describe '#process_instruction' do
    it 'should process valid instruction' do
      allow(STDOUT).to receive(:puts)
      @solution.rover = MarsRover.new(0, 1, 1, 'N')
      expect(@solution.process_instruction('L')).not_to be_falsey
    end

    it 'should return false on invalid instruction' do
      allow(STDOUT).to receive(:puts)
      @solution.rover = MarsRover.new(0, 1, 1, 'N')
      expect(@solution.process_instruction('Q')).to be_falsey
    end
  end
end
