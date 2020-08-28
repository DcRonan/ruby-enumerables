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

  # def my_all?(arr = nil)
  #   arr_size = arr.length

  #   return_value = false

  #   arr_size.times do |i|
  #     unless !yield(arr[i]) || arr[i].nil? ||
  #            arr[i] == false || yield(arr[i]).empty?
  #       return_value = true
  #     end
  #   end
  #   return_value
  # end

  def my_all?(arr)
    return false unless block_given?

    # new array that contains the passed arguments
    new_arr = []
    false_arr = []
    arr_size = arr.length
    result = true
    # loop through array and pushes elements that are true
    arr_size.times do |x|
      new_arr.push(arr[x]) if yield(arr[x])
    end
    arr_size.times do |i|
      false_arr.push(arr[i]) if !yield(arr[i])
    end
    if new_arr.empty? || false_arr.empty?
      result
    else
      result = false
    end
    result
  end

  # ========
  #  my_any
  # ========

  def my_any?(arr)
    arr_size = arr.length

    result_arr = []

    true_value = true

    arr_size.times do |i|
      if yield(arr[i])
        result_arr.push(true)
      else
        result_arr.push(false)
      end
    end
    result_arr.include? true_value ? true : false
  end

  # =========
  #  my_none
  # =========

  def my_none?(arr)
    return false unless block_given?
    
    arr_size = arr.length

    return_value = true

    arr_size.times do |i|
      unless !yield(arr[i]) || arr[i].nil? ||
             arr[i] == false 
        return_value = false
      end
    end

    return_value
  end
end
