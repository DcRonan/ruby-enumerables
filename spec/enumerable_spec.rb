require './main'

describe Enumerable do
  let(:arr) { [1, 50, 12, 99, 130, 17, 13] }
  let(:arr_str) { %w[Daniel Connor Ronan] }
  let(:range) { (1..10) }
  let(:hash) { [{'Jane Doe' => 10}, {'Jim Doe' => 6}, {'Joe Doe' => 7}, {'Dan Doe' => 4}] }

  let(:result) { [] }
  let(:actual) { [] }

  describe '#my_each' do
    it 'Returns each element of the array of Strings' do
      expect(arr_str.my_each { |i| result << i }).to eq(arr_str.each { |i| actual << i })
    end

    it 'Returns each element of an array of Integers' do
      expect(arr.my_each { |i| result << i }).to eq(arr.each { |i| actual << i })
    end

    it 'Returns each element and value of a given Hash' do
      expect(hash.my_each { |i| result << i }).to eq(hash.each { |i| actual << i })
    end

    it 'Returns each integer from a given Range' do
      expect(range.my_each { |i| result << i }).to eq(range.each { |i| actual << i })
    end

    it 'Returns an Enumerator if no block is given' do
      expect(arr.my_each).to be_a(Enumerator)
    end
  end

  describe 'my_each_with_index' do
    it 'Returns each element within in the Array of integers along with it\'s index' do
      expect(arr.my_each_with_index { |n, i| result << "#{n} : #{i}" }).to eq(arr.each_with_index { |n, i| actual << "#{i} : #{n}" })
    end

    it 'Returns each element of the Array containing Strings along with it\'s index' do
      expect(arr_str.my_each_with_index { |n, i| result << "#{i} : #{n}" }).to eq(arr_str.each_with_index { |n, i| actual << "#{i} : #{n}" })
    end

    it 'Returns each element of a given Range along with it\'s index' do
      expect(range.my_each_with_index { |n, i| result << "#{n} : #{i}" }).to eq(range.each_with_index { |n, i| actual << "#{n} : #{i}" })
    end

    it 'Returns each element and value of a given Hash along with it\'s index' do
      expect(hash.my_each_with_index { |n, i| result << "#{n} : #{i}" }).to eq(hash.each_with_index { |n, i| actual << "#{i} : #{n}" })
    end

    it 'Returns an Enumerator if no block is given' do
      expect(arr.my_each_with_index).to be_a(Enumerator)
    end
  end
end
