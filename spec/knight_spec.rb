# frozen_string_literal: true

require_relative '../lib/knight'

RSpec.describe Knight do 
  describe '#initialize' do 
    context 'can create a knight class' do
      xit 'creates a class' do 
        expect(Knight).to receive(:new).with([0,0], [1,2])
        Knight.new([0,0], [1,2])
      end
    end
  end

  describe '#travail' do
    subject(:knight) {Knight.new([0,0], [3,3])}
    subject(:knight_black) {Knight.new([1,2], [3,3], [[0,0]]) }
      context 'knight will move per rules within the grid' do

        xit 'Calculates 8 new positions' do
          knight.travail
          expect(knight.possible_positions).to eql([[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 1]])
        end

        xit 'Filters out positions not on the grid' do
          knight.travail
          expect(knight.new_positions).to eql([[1, 2], [2, 1]])
        end

        xit 'Filters out previously visited positions' do 
          knight_black.travail
          expect(knight_black.new_positions).to eql([[2, 4], [3, 3], [3, 1], [2, 0], [0, 3]])
        end

        xit 'returns an array of all possible correct positions' do
          array = knight.travail
          expect(array).to eql([[1, 2], [2, 1]])
        end

        xit 'returns true if can reach the goal' do
          white = Knight.new([0,0], [2,1])
          white.travail
          expect(white.goal?).to be(true)
        end
      end
  end

end