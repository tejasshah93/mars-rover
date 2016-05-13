# spec/mars_rover_spec.rb

require_relative 'spec_helper'

describe MarsRover do
  before :each do
    @rover = MarsRover.new(0, 1, 1, 'N')
  end

  describe '#new' do
    it 'should return a new rover object' do
      expect(@rover).to be_a MarsRover
    end

    it 'should not return nil' do
      expect(@rover).not_to be_nil
    end
  end

  describe '#move' do
    it 'should call move_forward on Direction attr' do
      expect(@rover.dir).to receive(:move_forward)
      @rover.move
    end
  end

  describe '#rotate_right' do
    it 'should call turn_right on Direction attr' do
      expect(@rover.dir).to receive(:turn_right)
      @rover.rotate_right
    end
  end

  describe '#rotote_left' do
    it 'should call turn_left on Direction attr' do
      expect(@rover.dir).to receive(:turn_left)
      @rover.rotate_left
    end
  end
end
