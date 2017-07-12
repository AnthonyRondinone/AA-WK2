require 'rspec'
require 'tdd'

describe Array do
  describe '#my_uniq' do
    subject(:arr) { [1,2,3,3] }
    let(:arr2) { [1,2,3,4,5,6,6,6] }

    it "returns a unique array" do
      expect(arr.my_uniq).to eq([1,2,3])
      expect(arr2.my_uniq).to eq([1,2,3,4,5,6])
    end

    it "doesn't mutate the original" do
      arr.my_uniq
      expect(arr).to eq([1,2,3,3])
    end
  end

  describe '#two_sum' do
    subject(:arr) { [1,-1,5,3,-5] }
    let(:arr2) { [1,-5,4,5] }

    it "returns all indexed pairs that sum to 0" do
      expect(arr.two_sum).to eq([[0,1],[2,4]])
      expect(arr2.two_sum).to eq([[1,3]])
    end
  end

  describe '#my_transpose' do
    subject(:arr) { [[0, 1, 2],[3, 4, 5],[6, 7, 8]] }
    let(:arr2) { [[0, 1, 2],[3, 4, 5],[6, 7]] }

    it "transposes an array" do
      expect(arr.my_transpose).to eq( [[0,3,6],[1,4,7],[2,5,8]] )
    end

    it "raises an error if input matrix is invalid" do
      expect{ arr2.my_transpose }.to raise_error("Invalid input matrix")
    end
  end

  describe '#stock_picker' do
    subject(:arr) { [5,6,8,7,6,5,2,6,10,12,11,10,1,3] }
    let(:arr2) { [12,10,9,7,5,3] }

    it "returns the most profitable pair of days" do
      expect(arr.stock_picker).to eq( [6,9] )
      expect(arr2.stock_picker).to eq( [1,2] )
    end
  end
end
