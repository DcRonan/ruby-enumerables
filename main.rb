# rubocop:disable Metrics/ModuleLength
module Enumerable
  # =========
  #  my_each
  # =========

  def my_each(arr = nil)
    return to_enum unless block_given?

    # variable for the array's length
    arr_size = Array(self).length
    # loops and returns each number in the array
    arr_size.times do |i|
      yield(Array(self)[i])
    end
    self
  end

  # ====================
  #  my_each_with_index
  # ====================

  def my_each_with_index(arr = nil)
    return to_enum unless block_given?

    arr_size = Array(self).length
    # loops and returns each number and index in the array
    arr_size.times do |i|
      yield(Array(self)[i], i)
    end
    self
  end

  # ===========
  #  my_select
  # ===========

  def my_select(arr = nil)
    return to_enum unless block_given?

    # new array that contains the passed arguments
    new_arr = []
    arr_size = Array(self).length
    # loop through array and pushes elements that are true
    arr_size.times do |x|
      new_arr.push(Array(self)[x]) if yield(Array(self)[x])
    end
    new_arr
  end

  # ========
  #  my_all
  # ========

  # def my_all?(arr = nil)
  #   return false unless block_given?

  #   # new array that contains the passed arguments
  #   new_arr = []
  #   false_arr = []
  #   result = true
  #   # loop through array and pushes elements that are true
  #   my_each do |x|
  #     if yield(Array(self)[x])
  #       if yield(Array(self)[x]).class == Integer
  #         new_arr.push(Array(self)[x]) 
  #       elsif yield(Array(self)[x]).class == Float 
  #         #should raise an error if even? or odd? methods are in the block

  #         new_arr.push(Array(self)[x]) 
  #       elsif yield(Array(self)[x]).class == String
  #         new_arr.push(Array(self)[x]) if yield(Array(self)[x]).match?(self) #regex/../
  #       end
  #     end
  #   end
  #   arr_size.times do |i|
  #     false_arr.push(Array(self)[i]) unless yield(Array(self)[i])
  #   end
  #   if new_arr.empty? || false_arr.empty?
  #     result
  #   else
  #     result = false
  #   end
  #   result
  # end

  def my_all?(arr = nil, regex_exp = /[a-z][A-Z][0-9]/) #regex for symbols 
    return false if !block_given? && arr.nil?

    #regex_exp = /^[a-z][A_Z]$/g
    #regex_exp = /[a-z][A-Z][0-9]/

    result = true
    # loop through array and pushes elements that are true
    my_each do |i|
      if arr.nil?
        my_each do |i|
         return result = false unless yield(i)
        end
      elsif arr == String || arr == Regexp
        my_each do |x|
          return result = false unless x.match(regex_exp)
          #puts "#{arr}"
        end
      elsif arr == Integer
        my_each do |y|
          return result = false unless y == arr
        end
      end  
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
end

# rubocop:enable Metrics/ModuleLength
