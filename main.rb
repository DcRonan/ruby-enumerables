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
    # times loop and returns each number and index in the array
    arr_size.times do |i|
      yield(arr[i], i)
    end
    # return initial array
    arr
  end

  # p my_each_with_index([1,5,25,56,100]) { |element, index| puts "#{element} and #{index}" }

  # ===========
  #  my_select
  # ===========

  def my_select(arr)

    new_arr = []

    arr.my_each do |x| 
    if x < 50
      x.push(new_arr)
    end
    new_arr
  end  

  p my_select([1, 4, 5, 50, 90, 70, 12]) { |element| puts element }
end
