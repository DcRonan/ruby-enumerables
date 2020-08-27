module Enumerable
  #my_each method definition
  
  def my_each(array)
    #check if block is given
    yield if block_given?

    #if block is given, iterate through the array
    for i in 0..array.size() - 1
      #push yield array element to new_array
      yield(array[i])
    end
    array
  end

 #my_each block - for arrays
 my_each(array) { |element| p element * 2 }

# times test
  #var_size.times do |i|
    #puts "hi: #{i}" 
  #end
  #print var

end
