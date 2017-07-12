require 'rspec'
require 'towers'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  let(:towers) { game.towers }
  describe '#new' do
    it "creates three towers" do
      expect(game.towers.length).to eq(3)
    end

    it "starts with three discs in the first tower" do
      expect(game.towers.first.length).to eq(3)
    end
  end

  describe '#move' do
    before(:each) do
      game.move(0,1)
    end
    it "moves a disc to a new tower" do
      expect(towers[1]).to eq( [1] )
    end

    it "removes a disc from old tower" do
      expect(towers[0]).to eq( [3,2] )
    end

    it "doesn't move a larger disc onto a smaller disc" do
      expect { game.move(0,1) }.to raise_error("Can't do that.")
    end
  end

  describe '#won?' do

    it "returns true if all the discs are in another tower" do
      allow(game).to receive(:towers).and_return([ [], [3,2,1], [] ] )
      expect(game.won?).to eq(true)
    end

    it "returns false if they're not all in another tower"
  end
end
