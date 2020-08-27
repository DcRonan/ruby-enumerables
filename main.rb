module Enumerable
  #my_each method definition
  def my_each(array)
    #check if block is given
    yield if block_given?
    
    new_array= []

    #if block is given, iterate through the array/hash (don't use #each method)
    for i in 0..array.length - 1
      #push yield array/hash element to new_array_hash
      new_array.push(yield(array[i]))

      #ppush yield hash key and value to new_array_hash
      new_array.push(yield(array[i], value))
    end
  end

  #my_each block - for arrays and hashes
  my_each(array) { |element| element }

  #my_each block - for hashes
  #my_each(array) do |key, value|  
    #key
    #value
  #end
end
