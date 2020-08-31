module Enumerable
  # =========
  #  my_each
  # =========

  def my_each(arr)
    return arr unless block_given?

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
    return arr unless block_given?
    
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
      false_arr.push(arr[i]) unless yield(arr[i])
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

  # ==========
  #  my_none?
  # ==========

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

  # ==========
  #  my_count
  # ==========

  def my_count(arr)
    return arr.length unless block_given?

    arr_size = arr.length
    count = 0

    arr_size.times do |i|
      count += 1 if yield(arr[i])
    end
    count
  end

  # ========
  #  my_map
  # ========

  def my_map(arr)
    arr = arr.to_a
    return "#<Enumerator: #{arr}: map" unless block_given?

    arr_size = arr.length
    new_arr = []

    arr_size.times do |i|
      if block_given?
        new_arr << yield(arr[i])
      elsif yield(arr[i]).empty?
        nil_value = nil
        new_arr << nil_value
      end
    end
    new_arr
  end

  # ===========
  #  my_inject
  # ===========

  def my_inject(arr)
    result = 0
    sum = 0
    string = ''
    return '#<Enumerator: ${arr}: map' unless block_given?

    arr_size = arr.length
    arr_size.times do |i|
      if block_given?
        if arr[i].class == Integer || arr[i].class == Float
          result += yield(sum, arr[i])
        elsif arr[i].class == String
          result = yield(string, arr[i])
        end
        # return nil if yield(sum,arr[i]).empty? ||
        # yield(string,arr[i]).empty?
      end
    end
    result
  end

  # =============
  #  multiply_els
  # =============

  def multiply_els(arr)
    arr.my_inject(:*)
  end  

  # ==============================
  #  my_map using procs and blocks
  # ==============================

  #Procs and blocks for my_map method
  def my_map(arr, prc)
    arr = arr.to_a
    return "#<Enumerator: #{arr}: map" unless block_given?

    arr_size = arr.length
    new_arr = []

    arr_size.times do |i|
      #p prc.call(yield(arr[i]))
      if block_given?
       #p prc.call(yield(arr[i]))
        new_arr << yield(arr[i])
      elsif yield(arr[i]).empty?
        nil_value = nil
        new_arr << nil_value
      end
    end
    new_arr
  end

  #define a proc
  proc = Proc.new {|i| i * 2}
  
  #use either proc or block; do a conversion
  #p y_squared.call(5)
  p my_map([1,2,3,4,5], proc)
  
  #define a proc
  #my_map([1,2,3,4]) { |element| element * element } 


  end
