module Enumerable
  #my_each method definition
  def my_each(array)
    #check if block is given
    yield if block_given?
    new_array = []

    #if block is given, iterate through the array
    for i in 0..array.length - 1
      #push yield array element to new_array
      new_array.push(yield(array[i]))

    end
  end
  #my_each block - for arrays
 my_each(array) { |element| element }

# times test
  var_size.times do |i|
    puts "hi: #{i}" 
  end
  print var

end
