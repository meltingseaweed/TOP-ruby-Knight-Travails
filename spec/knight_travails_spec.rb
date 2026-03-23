# frozen_string_literal: true

require_relative '../lib/knight_travails'

RSpec.describe Knight do
  describe 'can run the function travails' do
    subject(:knight) { Knight.new([0,0], [3,3]) }
    context 'creating new objects' do 
      it 'can access knight class and create new knights' do
        expect(Knight).to receive(:new).with([0,0], [3,4])
        Knight.new([0,0], [3,4])
      end

      it 'can loop until one knight reaches the goal' do
        expect(KnightTravails.goal_reached).to be(true)
        knight.travail
      end 
    end
  end
end