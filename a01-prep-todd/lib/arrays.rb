#### Arrays ####

class Array
  # Write a method that returns an array of all of the pairs of indexes whose
  # elements sum to zero
  def two_sum
    result = []
    (0...self.length - 1).each do |index1|
      (index1+1..self.length - 1).each do |index2|
        result << [index1,index2] if self[index1] + self[index2] == 0
      end
    end
    result
  end

  # Write a method that returns a hash containing any repeating elements as keys
  # with the values set to an array of the indexes of each repeat
  def dups
    result = {}
    self.each_with_index do |el,index|
      result[el] = [] unless result[el]
      result[el] << index
    end
    result.select {|_,v| v.length > 1}
  end

  # Write a method that returns the sum of all elements in the array
  def sum
    result = 0
    self.each {|el| result+=el}
    result
  end

  # Write a method that squares each element in the array
  def square!
    self.map! {|el| el*el}
  end

  # Write a method that squares each element in the array, but does not modify the array
  def square
    self.dup.square!
  end

  # Write a method that returns all of the unique elements in an array
  def my_uniq
    result = []
    self.each {|el| result << el unless result.include?(el)}
    result
  end

  # Write a method that tranposes an array (see Array#transpose)
  def my_transpose
  end

  # Write a method that returns the median of elements in an array
  # If the length is even, return the average of the middle two elements
  def median
  end
end
