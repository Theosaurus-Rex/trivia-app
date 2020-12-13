#Tests for player_class.rb
require_relative './player-class.rb'

describe "Player Class" do
    it 'should initialise with variable name' do
        joe = Player.new("Joe")
        expect(joe.name).to eq("Joe")
    end
    it 'should initialise with score at 0' do
        carlos = Player.new("Carlos")
        expect(carlos.score).to eq(0)
    end
end