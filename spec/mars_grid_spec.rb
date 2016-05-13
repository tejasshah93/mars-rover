# spec/mars_grid_spec.rb

require_relative 'spec_helper'

describe MarsGrid do
  before :each do
    @grid = MarsGrid.new(5, 5)
  end

  describe '#new' do
    it 'should return a new MarsGrid object' do
      expect(@grid).to be_a MarsGrid
    end

    it 'should not return nil' do
      expect(@grid).not_to be_nil
    end
  end

  describe 'valid?' do
    it 'should return true on valid rover coordinates based on grid config' do
      rover = MarsRover.new(0, 1, 1, 'N')
      expect(@grid.valid?(rover.dir.x_value, rover.dir.y_value, rover.dir.face))
        .to be_truthy
    end

    it 'should return false if rover.x / rover.y is invalid for grid config' do
      rover = MarsRover.new(0, 1, 6, 'N')
      expect(@grid.valid?(rover.dir.x_value, rover.dir.y_value, rover.dir.face))
        .to be_falsey
    end

    it 'should return false if rover.face is invalid' do
      rover = MarsRover.new(0, 1, 1, 'Q')
      expect(@grid.valid?(rover.dir.x_value, rover.dir.y_value, rover.dir.face))
        .to be_falsey
    end
  end
end
