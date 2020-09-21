require './main'

describe Enumerable do
  let(:arr) { [1, 50, 12, 99, 130, 17, 13] }
  let(:arr_str) { %w[Daniel Connor Ronan] }
  let(:range) {1..10}
  let(:hash) { ['Jane Doe' => 10, 'Jim Doe' => 6, 'Joe Doe' => 7, 'Dan Doe' => 4] }

  let(:result) {[]}
  let(:actual) {[]}

  describe '#my_each' do
    it 'Returns each element of the array of Strings.' do
      expect(arr_str.my_each { |i| result << i }).to eq(arr_str.each { |i| actual << i })
    end

    it 'Returns each element of an array of Integers.' do
      expect(arr.my_each { |i| result << i }).to eq(arr.each { |i| actual << i })
    end

    it 'Returns each element of a given Hash.' do
      expect(hash.my_each { |i| result << i }).to eq(hash.each { |i| actual << i })
    end

    it 'Returns each integer from a given Range.' do
      expect(range.my_each { |i| result << i }).to eq(range.each { |i| actual << i })
    end

    it 'Returns an Enumerator if no block is given' do
      expect(arr.my_each).to be_a(Enumerator)
    end
  end
end