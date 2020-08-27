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

# p test([1, 4, 5, 6, 100, 500, 14]) { |element| puts element }

end
