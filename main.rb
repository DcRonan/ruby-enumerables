# rubocop:disable Style/CaseEquality

module Enumerable

# =========
#  my_each
# =========  

def my_each(arr)
  arr_size = arr.length
  arr_size.times do |i|
    yield(arr[i])
  end
  arr
end

# p test([1, 4, 5, 6, 100, 500, 14]) { |element| puts element }

end
