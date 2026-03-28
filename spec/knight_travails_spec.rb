# frozen_string_literal: true

require_relative '../lib/knight_travails'

RSpec.describe Knight do
  describe 'method knight_moves' do
    subject(:queue_kn) { Travails.new }
    context 'can travail from start to goal' do
      it 'can loop 2 times and reach the goal' do
        shortest_route = queue_kn.knight_moves([0,0], [3,3])
        expect(shortest_route).to eql([[0,0], [1,2], [3,3]])
      end

      it 'can loop 3 times and reach the goal' do
        shortest_route = queue_kn.knight_moves([0,0], [1,6])
        expect(shortest_route).to eql([[0,0], [1,2], [2,4], [1,6]])
      end

      it 'completes the path shown on the project page' do
        shortest_route = queue_kn.knight_moves([3,3], [4,3])
        expect(shortest_route).to eql([[3,3], [4,5], [6,4], [4,3]])
      end
    end
  end
end