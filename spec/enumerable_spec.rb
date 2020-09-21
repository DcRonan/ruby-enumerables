# rubocop:disable Layout/LineLength

require './main'

describe Enumerable do
  let(:arr) { [1, 50, 12, 99, 130, 17, 13] }
  let(:arr_str) { %w[Daniel Connor Ronan] }
  let(:range) { (1..10) }
  let(:hash) { { 'Jane Doe' => 10, 'Jim Doe' => 6, 'Joe Doe' => 7, 'Dan Doe' => 4 } }
  let(:arr_empty) { [] }
  let(:nil_true) { [nil, true, 99] }
  let(:str_num) { ['Daniel', 50, 3.5] }
  let(:float_nums) { [2.5, 5, 5.6] }
  let(:nil_false) { [nil, false] }

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

  describe '#my_select' do
    it 'Returns and selects every element in a given Array of Integers that passes the given block' do
      expect(arr.my_select { |i| i.even? ? result << i : nil }).to eq(arr.select { |i| i.even? ? actual << i : nil })
    end

    it 'Returns and selects every element in a given Range that passes the given block' do
      expect(range.my_select { |i| i.even? ? result << i : nil }).to eq(range.select { |i| i.even? ? actual << i : nil })
    end

    it 'Returns and selects every element in the Array of Strings that passes the given block' do
      expect(arr_str.my_select { |i| i == 'Ronan' ? result << i : nil }).to eq(arr_str.select { |i| i == 'Ronan' ? actual << i : nil })
    end

    it 'Returns an Enumerator if no block is given' do
      expect(arr.my_select).to be_a(Enumerator)
    end
  end

  describe '#my_all?' do
    it 'It returns false if no block is given' do
      expect(arr.my_all? {}).to be false
    end

    it 'Checks if every element in the Array of Integers passes the given block' do
      expect(arr.my_all? { |i| i <= 130 }).to be true
    end

    it 'Checks if every element in the Range passes the given block' do
      expect(range.my_all? { |i| i > 10 }).to be false
    end

    it 'Checks if every key or value in the Hash passes the given block' do
      expect(hash.my_all? { |_i, v| v.odd? }).to be false
    end

    it 'Checks if every element in the Array of Strings contains a word or letter' do
      expect(arr_str.my_all?(/n/)).to be true
    end

    it 'Checks if every element in the Array is an Integer' do
      expect(arr.my_all?(Integer)).to be true
    end

    it 'Checks if every element in the Array is a String' do
      expect(arr_str.my_all?(String)).to be true
    end

    it 'Returns true if an empty array has been given' do
      expect(arr_empty.my_all?).to be true
    end

    it 'Returns false if the array returns false or nil' do
      expect(nil_true.my_all?).to be false
    end
  end

  describe '#my_any?' do
    it 'Checks if any element in the Array of Integers passes the given block' do
      expect(arr.my_any? { |i| i >= 12 }).to be true
    end

    it 'Checks if any element in the Range passes the given block' do
      expect(range.my_any? { |i| i >= 10 }).to be true
    end

    it 'Checks if any key or value in the Hash passes the given block' do
      expect(hash.my_any? { |_i, v| v.odd? }).to be true
    end

    it 'Checks if any element in the Array of Strings contains a word or letter' do
      expect(arr_str.my_any?(/e/)).to be true
    end

    it 'Checks if any element in the Array is an Integer' do
      expect(nil_true.my_any?(Integer)).to be true
    end

    it 'Checks if any element in the Array is a String' do
      expect(str_num.my_any?(String)).to be true
    end

    it 'Returns false if an empty array has been given' do
      expect(arr_empty.my_any?).to be false
    end

    it 'Returns true if the block returns a value other than false or nil' do
      expect(nil_true.my_any?).to be true
    end
  end

  describe '#my_none?' do
    it 'Checks if none of the elements in the Array of Integers passes the given block' do
      expect(arr.my_none? { |i| i >= 130 }).to be false
    end

    it 'Checks if none of the elements in the Range passes the given block' do
      expect(range.my_none? { |i| i > 10 }).to be true
    end

    it 'Checks if none of the keys or values in the Hash passes the given block' do
      expect(hash.my_none? { |_i, v| v <= 10 }).to be false
    end

    it 'Checks if none of the elements in the Array of Strings contains a word or letter' do
      expect(arr_str.my_none?(/q/)).to be true
    end

    it 'Checks if none of the elements in the Array is an Integer' do
      expect(nil_true.my_none?(Integer)).to be false
    end

    it 'Checks if none of the elements in the Array is a String' do
      expect(str_num.my_none?(String)).to be false
    end

    it 'Returns true if an empty array has been given' do
      expect(arr_empty.my_none?).to be true
    end

    it 'Returns true if none of block returns a true value' do
      expect(nil_false.my_none?).to be true
    end

    it 'Checks if none of the elements is a Float' do
      expect(float_nums.my_none?(Float)).to be false
    end
  end
end

# rubocop:enable Layout/LineLength
