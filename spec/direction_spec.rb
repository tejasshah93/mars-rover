# spec/direction_spec.rb

require_relative 'spec_helper'

describe Direction do
  before :each do
    @dir = Direction.new(1, 1, 'N')
  end

  describe '#new' do
    it 'should return a new Direction object' do
      expect(@dir).to be_a Direction
    end

    it 'should not return nil' do
      expect(@dir).not_to be_nil
    end
  end

  describe '#turn_left' do
    it 'should return a new facing direction' do
      rest_faces = %w(N S E W) - [@dir.face]
      @dir.turn_left
      expect(rest_faces).to include @dir.face
    end

    it 'should rotate current facing towards left' do
      @dir.turn_left
      expect(@dir.face).to eq('W')
    end
  end

  describe '#turn_right' do
    it 'should return a new facing direction' do
      rest_faces = %w(N S E W) - [@dir.face]
      @dir.turn_right
      expect(rest_faces).to include @dir.face
    end

    it 'should rotate current facing towards right' do
      @dir.turn_right
      expect(@dir.face).to eq('E')
    end
  end

  describe '#move_forward' do
    it 'should move a single step in current facing' do
      prev_y_value = @dir.y_value
      @dir.move_forward
      expect(@dir.y_value - prev_y_value).to eq(1)
    end

    it 'should move only along single axis' do
      prev_x_value = @dir.x_value
      @dir.move_forward
      expect(@dir.x_value - prev_x_value).to eq(0)
    end
  end
end
