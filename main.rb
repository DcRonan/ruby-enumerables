# rubocop:disable Style/CaseEquality

module Enumerable

# =========
#  my_each
# =========  

def my_each(arr)
  # variable for the array's length
  arr_size = arr.length
  # times loop and returns each number in the array
  arr_size.times do |i|
    yield(arr[i])
  end
  # return initial array
  arr
end

# p my_each([1, 4, 5, 6, 100, 500, 14]) { |element| puts element }

  # ====================
  #  my_each_with_index
  # ====================  

  def my_each_with_index(arr)
    arr_size = arr.length
    # times loop and returns each number in the array
    arr_size.times do |i|
      yield(arr[i], i)
    end
    # return initial array
    arr
  end

  #p my_each_with_index([1,2,3,4,5]) { |element, index| puts "#{element} and #{index}" }
end
