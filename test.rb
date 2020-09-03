require_relative 'main.rb'
arr = [4, 6, 4, 4, 6, 10, 12, 12, 6, 14, 4]
arr_three = [4, 6, 4, 4, 6, 10, 12, 12, 6, 13, 3, 3, 3]
arr_dec = [1.0, 2.0, 3.0, 0.0]
arr_two = [5, 6, 7, 8, 9, 10]
hash = { 'Jane Doe' => 10, 'Jim Doe' => 6, 'Joe Doe' => 7, 'Dan Doe' => 4 }
range = (10..15)
####### test cases for my_each ###########
# p arr.my_each
# p arr.my_each { |i| puts i }
# p range.my_each { |i| puts i }
# p hash.my_each { |i, j| puts "#{i} : #{j}"}
##########################################
### test cases for my_each_with_index ####
# p range.my_each_with_index { |i , x| puts "#{i} : #{x}"}
# p arr.my_each_with_index { |i, j| puts "#{j} : #{i}" }
# p hash.my_each_with_index { |i, j| puts "#{j} : #{i}"}
# p arr.my_each_with_index
##########################################
####### test cases for my_select #########
# p arr.my_select { |i| i.even? }
# p range.my_select { |i| i.even? }
# p hash.my_select { |i , j| j.even? } # j here is the value
# p (1..10).find_all { |i|  i % 3 == 0 }   #=> [3, 6, 9]
# p [1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]
# p arr.my_select
##########################################
####### test cases for my_all? ###########
# p [1, 2, 3, 4].my_all? {  }
# p arr.my_all? { |i| i.even? }
# p range.my_all? { |i| i.even? }
# p hash.my_all? { |i, j| j.even? } # j here is the value
# p ['Daniel', 'Connor', 'Ronan'].my_all?(/n/)
# p ['Daniel', 'Connor', 'Ronan'].my_all?(/v/)
# p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# p %w[ant bear cat].my_all?(/t/)                        #=> false
# p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# p [nil, true, 99].my_all?                                #=> false
# p ["hey", nil, false].my_all?                            #=> false
# p [].my_all?                                           #=> true
##########################################
####### test cases for my_any? ###########
# p arr.my_any? { |i| i.even? }
# p range.my_any? { |i| i.even? }
# p hash.my_any? { |i, j| j.odd? } # j here is the value
# p ['Daniel', 'Connor', 'Ronan'].my_any?(/a/)
# p ['Daniel', 'Connor', 'Ronan'].my_any?(/v/)
# p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# p %w[ant bear cat].my_any?(/d/)                        #=> false
# p [nil, true, 99].my_any?(Integer)                     #=> true
# p [nil, true, 99].my_any?                              #=> true
# p [].my_any?                                           #=> false
# p [ nil, false, false ].my_any?                            #=> false
##########################################
####### test cases for my_none? ##########
# p arr.my_none? { |i| i.odd? }
# p range.my_none? { |i| i.even? }
# p hash.my_none? { |i, j| j.odd? } # j here is the value
# p ['Daniel', 'Connor', 'Ronan'].my_none?(/u/)
# p ['Daniel', 'Connor', 'Ronan'].my_none?(/v/)
# p %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
# p %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
# p %w{ant bear cat}.my_none?(/d/)                        #=> true
# p [1, 3.14, 42].my_none?(Float)                         #=> false
# p [].my_none?                                           #=> true
# p [nil].my_none?                                        #=> true
# p [nil, false].my_none?                                 #=> true
# p [nil, false, true].my_none?                           #=> false
##########################################
####### test cases for my_count#########
# p arr.my_count     #=> 11
# p range.my_count  #=> 6
# p hash.my_count     #=> 4
# p arr.my_count(3)    #=> 1
# p range.my_count(11)  #=>  1
# p hash.my_count(2)    #=> 0
# p arr.my_count{ |x| x % 2 == 0 }    #=> 10
# p [0,0,0,4,5,7,8,0,2,1,0].my_count(0) #=> 5
##########################################
####### test cases for my_map #########
# p arr.my_map {|i| i * i}
# p [2, 6, 4, 6, 8].my_map{|i| i * i}
# proc = Proc.new {|i| i**3}
# p arr.my_map(&proc)
# p arr.my_map {|i| i**2}
# p arr.my_map
# p (1..4).my_map { |i| i * i }  #=> [1, 4, 9, 16]
##########################################
####### test cases for my_inject #########
# p arr.my_inject { |i| i * 3 }
# p arr_two.my_inject { |i| i * 3 }
# p [2, 6, 4, 6, 8].my_inject { |i| i * 5 }
# p arr.my_inject { |i| i**2 }
# p arr.my_inject (:*)
# p arr_three.my_inject { |sum, x| sum + x } #return 86
# p arr_three.my_inject(1) { |sum, x| sum + x } #return 87
# p (5..10).my_inject { |sum, n| sum + n } #=> 45
# p (5..10).my_inject(1) { |product, n| product * n } #=> 151200
##########################################
# p multiply_els(arr)
##########################################
