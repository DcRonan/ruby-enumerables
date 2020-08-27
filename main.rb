module Enumerable
  # =========
  #  my_each
  # =========

  def my_each(arr)
    # variable for the array's length
    arr_size = arr.length
    # loops and returns each number in the array
    arr_size.times do |i|
      yield(arr[i])
    end
    arr
  end

  # ====================
  #  my_each_with_index
  # ====================

  def my_each_with_index(arr)
    arr_size = arr.length
    # loops and returns each number and index in the array
    arr_size.times do |i|
      yield(arr[i], i)
    end
    arr
  end

  # ===========
  #  my_select
  # ===========

  def my_select(arr)
    # new array that contains the passed arguments
    new_arr = []
    arr_size = arr.length
    # loop through array and pushes elements that are true
    arr_size.times do |x|
      new_arr.push(arr[x]) if yield(arr[x])
    end
    new_arr
  end

  # ========
  #  my_all
  # ========

  def my_all?(arr)
    arr_size = arr.length

    arr_size.times do |i|
     return true if yield(arr[i]) == true  
    end
    arr   
  end  
  
  p my_all?(%w[ant be cat]) { |word| word.length >= 3 }
end
