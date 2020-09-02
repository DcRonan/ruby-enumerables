# rubocop:disable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
module Enumerable
  # =========
  #  my_each
  # =========

  def my_each(_arr = nil)
    return to_enum(:my_each) unless block_given?

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

  def my_each_with_index(_arr = nil)
    return to_enum(my_each_with_index) unless block_given?

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

  def my_select(_arr = nil)
    return to_enum(:my_select) unless block_given?

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

  def my_all?(arg = nil)
    result = false

    if !arg.nil? && arg.is_a?(Class)
      my_each { |i| return result unless i.is_a?(arg) }
    elsif !arg.nil? && arg.is_a?(Integer)
      my_each { |x| return result unless x == arg }
    elsif !arg.nil? && arg.is_a?(Regexp) || arg.is_a?(String)
      my_each { |y| return result unless y.match(arg) }
    elsif !block_given?
      my_each { |a| return result if a.nil? }
    elsif block_given?
      my_each { |b| return result unless yield(b) }
    end
    !result
  end

  # ========
  #  my_any
  # ========

  def my_any?(arg = nil)
    result = true

    if !arg.nil? && arg.is_a?(Class)
      my_each { |i| return result if i.is_a?(arg) }
    elsif !arg.nil? && arg.is_a?(Integer)
      my_each { |x| return result if x == arg }
    elsif !arg.nil? && arg.is_a?(Regexp) || arg.is_a?(String)
      my_each { |y| return result if y.match(arg) }
    elsif !block_given?
      my_each { |a| return result unless a.nil? }
    elsif block_given?
      my_each { |b| return result if yield(b) }
    end
    !result
  end

  # ==========
  #  my_none?
  # ==========

  def my_none?(arg = nil)
    result = false

    if !arg.nil? && arg.is_a?(Class)
      my_each { |i| return result if i.is_a?(arg) }
    elsif !arg.nil? && arg.is_a?(Integer)
      my_each { |x| return result if x == arg }
    elsif !arg.nil? && arg.is_a?(Regexp) || arg.is_a?(String)
      my_each { |y| return result if y.match(arg) }
    elsif !block_given?
      my_each { |a| return result unless a.nil? || !a }
    elsif block_given?
      my_each { |b| return result if yield(b) }
    end
    !result
  end

  # ==========
  #  my_count
  # ==========

  def my_count(count_one = 0)
    arr_size = Array(self).length
    count = 0

    unless block_given?
      return arr_size if count_one.zero?

      arr_size.times do |i|
        count += 1 if Array(self)[i] == count_one
      end
    end

    if block_given? && !Array(self).nil?
      arr_size.times do |i|
        count += 1 if yield(Array(self)[i])
      end
    end
    count
  end

  # ========
  #  my_map
  # ========

  def my_map(&_proc)
    new_arr = []

    my_each do |i|
      new_arr.push(yield(i))
    end
    new_arr
  end

  # ===========
  #  my_inject
  # ===========

  # def my_inject(arr = nil)
  #   result = 0
  #   sum = 0
  #   string = ''
  #   return to_enum unless block_given?

  #   arr_size = Array(self).length
  #   arr_size.times do |i|
  #     if block_given?
  #       if Array(self)[i].class == Integer || Array(self)[i].class == Float
  #         result += yield(sum, Array(self)[i])
  #       elsif Array(self)[i].class == String
  #         result = yield(string, Array(self)[i])
  #       end
  #     end
  #   end
  #   self
  # end

  # def my_inject(arr=mil)

  # memo = 0

  # if arr.nil?
  # my_each do |i, x|
  # memo += yield(i, x)
  # end
  # end
  # memo
  # end

  def my_inject(_accumulator = nil, operator = nil)
    result = 0
    result_one = ''
    arr_size = Array(self).length
    
    if block_given?
      if !_accumulator.nil? && !operator.is_a?(Symbol)
        arr_size.times do |i|
          if Array(self)[i].class == Integer
              return result += yield(sum, Array(self)[i])  
          elsif Array(self)[i].class == String

          end
        end
      end
    end
 end

  # making a test for my_inject(not working)
  # def my_inject(arr)
  #   result = []

  #   arr_size = arr.length

  #   arr_size.times do |i|
  #     arr_size.times do |x|
  #       result = arr[i] * arr[x]
  #     end
  #   end
  #   return result
  # end
end

# =============
#  multiply_els
# =============

def multiply_els(arr)
  arr.my_inject(:*)
end

# rubocop:enable Metrics/ModuleLength, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
