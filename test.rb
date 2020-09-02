require_relative 'main.rb'
# my_array = [4, 6, 4, 4, 6, 10, 12, 12, 6, 13, 3, 3, 3]
# my_array_one = [1.0, 2.0, 3.0, 0.0]
# my_array_two = [5, 6, 7, 8, 9, 10]
# my_hash = { 'Jane Doe' => 10, 'Jim Doe' => 6, 'Joe Doe' => 7, 'Dan Doe' => 4 }
# my_range = (10..15)
####### test cases for my_each ###########
# p my_array.my_each { |i| puts i }
# my_range.my_each { |i| puts i}
# p my_hash.my_each { |i, j| puts "#{i} : #{j}"}
##########################################
### test cases for my_each_with_index ####
# p my_range.my_each_with_index { |i , x| puts "#{i} : #{x}"}
# my_array.my_each_with_index { |i, j| p "#{j} : #{i}" }
# p my_hash.my_each_with_index { |i, j| puts "#{i} : #{j}"}
##########################################
####### test cases for my_select #########
# p my_array.my_select { |i| i.even? }
# p my_range.my_select { |i| i.even? }
# p my_hash.my_select { |i , j| j.even? }# j here is the value
##########################################
####### test cases for my_all? ###########
# p [nil, 1, 2, 3, 4].my_all?
# p [1, 2, false, 3, 4].my_all?
# p res = ['apple', 'orange'].my_all?
# p [1, 2, 3, 4].my_all? { }
# p my_array.my_all? { |i| i.even? }
# p my_array_one.my_all? { |i| i.even? }
# p my_range.my_all? { |i| i.even? }
# p my_hash.my_all? { |i, j| j.even? }# j here is the value
# p ['Daniel', 'Connor', 'Ronan'].my_all?(/n/)
# p ['Daniel', 'Connor', 'Ronan'].my_all?(/v/)
# p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# p %w[ant bear cat].my_all?(/t/)                        #=> false
# p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# p [nil, true, 99].my_all?                              #=> false
# p [].my_all?                                           #=> true
##########################################
####### test cases for my_any? ###########
#  p my_array.my_any? { |i| i.even? }
# p my_range.my_any? { |i| i.even? }
# p my_hash.my_any? { |i, j| j.odd? }# j here is the value
# p my_array.my_any?(3)
# p my_range.my_any?(11)
# p my_hash.my_any?(4)
# p res = ['apple', 'orange'].my_any?
# p ['Daniel', 'Connor', 'Ronan'].my_any?(/a/)
# p ['Daniel', 'Connor', 'Ronan'].my_any?(/v/)
# p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# p %w[ant bear cat].my_any?(/d/)                        #=> false
# p [nil, true, 99].my_any?(Integer)                     #=> true
# p [nil, true, 99].my_any?                              #=> true
# p [].my_any?                                           #=> false
##########################################
####### test cases for my_none? ##########
# p my_array.my_none? { |i| i.odd? }
# p my_range.my_none? { |i| i.even? }
# p my_hash.my_none? { |i, j| j.odd? }# j here is the value
# p my_array.my_none?(2)
# p my_range.my_none?(11)
# p my_hash.my_none?(4)
# p res = ['apple', 'orange'].my_none?
# p ['Gurbuz', 'Turkiye', 'uretim'].my_none?(/u/)
# p ['Gurbuz', 'Turkiye', 'kretim'].my_none?(/v/)
##########################################
####### test cases for my_count#########
# p my_array.my_count
# p my_range.my_count
# p my_hash.my_count
# p my_array.my_count(3)
# p my_range.my_count(11)
# p my_hash.my_count(2)
# p res = ['apple', 'apple', 'dante', 'cherry'].my_count { |element| element == 'apple' }
##########################################
####### test cases for my_map #########
# p my_array.my_map {|i| i * i}
# p [2, 6, 4, 6, 8].my_map{|i| i * i}
# proc = Proc.new {|i| i**3}
# p my_array.my_map(&proc)
# p my_array.my_map {|i| i**2}
# p my_array.my_map
##########################################
####### test cases for my_inject #########
# p my_array.my_inject { |i| i * 3 }
# p my_array.my_inject { |i| i * 3 }
# p my_array.my_inject { |sum, x| sum + x } #return 86
# p my_array.my_inject(1) { |sum, x| sum + x } #return 87
# p [2, 6, 4, 6, 8].my_inject{|i| i * 5}
# p my_array.my_inject {|i| i**2}
# p my_array_two.my_inject (:*)
##########################################
# p multiply_els(my_array)
##########################################
