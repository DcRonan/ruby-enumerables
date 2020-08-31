require_relative 'main.rb'
my_array = [2, 6, 4, 6, 8]
# my_hash = { 'Jane Doe' => 10, 'Jim Doe' => 6 }
# my_range = (10..15)
####### test cases for my_each ###########
# p my_array.my_each { |i|  i }
p my_each(my_array) {|i|  p i }
# my_range.each { |i| puts i}
# p my_hash.each { |i, j|  "#{i} : #{j}"}
##########################################
### test cases for my_each_with_index ####
# my_range.my_each_with_index { |i , x| p "#{x} : #{i}"}
# my_array.my_each_with_index { |i, j| p "#{j} : #{i}" }
# my_hash.my_each { |i, j| p "#{i} : #{j}"}
##########################################
####### test cases for my_select #########
# p my_array.my_select { |i| i.even? }
# p my_range.my_select { |i| i.even? }
# my_hash.my_select { |i , j| p j.even? }# j here is the value
##########################################
####### test cases for my_all? ###########
# p my_array.my_all? { |i| i.even? }
# p my_range.my_all? { |i| i.even? }
# p my_hash.my_all? { |i, j| j.even? }# j here is the value
# p res = ['apple', 'orange'].my_all?
# p ['Daniel', 'Connor', 'Ronan'].my_all?(/u/)
# p ['Daniel', 'Connor', 'Ronan'].my_all?(/v/)
##########################################
####### test cases for my_any? ###########
#  p my_array.my_any? { |i| i.even? }
# p my_range.my_any? { |i| i.even? }
# p my_hash.my_any? { |i, j| j.odd? }# j here is the value
# p my_array.my_any?(3)
# p my_range.my_any?(11)
# p my_hash.my_any?(4)
# p res = ['apple', 'orange'].my_any?
# p ['Daniel', 'Connor', 'Ronan'].my_any?(/u/)
# p ['Daniel', 'Connor', 'Ronan'].my_any?(/v/)
##########################################
####### test cases for my_none? ##########
# p my_array.my_none? { |i| i.odd? }
# p my_range.my_none? { |i| i.even? }
# p my_hash.my_none? { |i, j| j.odd? }# j here is the value
# p my_array.my_none?(3)
# p my_range.my_none?(11)
# p my_hash.my_none?(4)
# p res = ['apple', 'orange'].my_none?
# p ['Daniel', 'Connor', 'Ronan'].my_none?(/u/)
# p ['Daniel', 'Connor', 'Ronan'].my_none?(/v/)
##########################################
####### test cases for my_count#########
# p my_array.my_count
# p my_range.my_count
# p my_hash.my_count
# p my_array.my_count(3)
# p my_range.my_count(11)
# p my_hash.my_count(4)
# p (res = ['apple', 'dante', 'cherry'].my_count do |element| element == 'apple' end)
##########################################
####### test cases for my_map #########
# p my_map(arr) {|i| i * i}
# p [2, 6, 4, 6, 8].my_map{|i| i * i}
# proc = Proc.new {|i| i**2}
# p my_array.my_map(&proc)
# p my_array.my_map {|i| i**2}
# p my_array.my_map

#################


#Using a proc ; no conversion into a proc
#proc = Proc.new { |i| i * 2 }
#p my_map([1,2,3,4,5], proc) 
#def my_map(arr, prc).....end
  
#Using a block; convert block into a proc using '&'
#p my_map([1,2,3,4,5].reverse) { |i| i * 2 }
#def my_map(arr, &prc)......end
#working solution
  
#Using a proc; convert proc into a block then proc again
#proc = Proc.new { |i| i * 2 }
#p my_map([1,2,3,4,5].reverse, &proc)
#def my_map(arr, &prc)......end
#working solution

##########################################
####### test cases for my_inject #########
# p my_array.my_inject {|i| i * 3}
# p [2, 6, 4, 6, 8].my_inject{|i| i * 5}
# p my_array.my_inject {|i| i**2}
# p my_array.my_inject (:*)
##########################################
# p multiply_els(my_array)
##########################################