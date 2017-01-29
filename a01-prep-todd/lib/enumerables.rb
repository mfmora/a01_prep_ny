#### Enumerables ####

# Write a method that returns an array of all factors of a number
def factors(num)
  (1..num).select {|n| num % n == 0}
end

# Write a method that doubles each element in an array
def doubler(array)
  array.map {|el| el*2}
end

# Write a method that returns an array of the first n number of primes numbers
def primes(n)
  result = []
  counter = 2
  until result.length == n
    result << counter if is_prime?(counter)
    counter += 1
  end
  result
end

def is_prime?(n)
  (2...n).none? {|num| n % num == 0}
end

class Array

  def my_each(&prc)
    self.length.times { |index| prc.call(self[index])}
  end

  def my_each_with_index(&prc)
    self.length.times { |index| prc.call(self[index],index)}
  end

  def my_select(&prc)
  end

  def my_reject(&prc)
  end

  def my_any?(&prc)
  end

  def my_all?(&prc)
  end

  def my_flatten
  end

  # Write a version of flatten that only flattens n levels of an array.
  def my_controlled_flatten(n)
  end

  def my_zip(*arrs)
  end

  def my_rotate(num=1)
  end

  def my_join(str = "")
  end

  def my_reverse
  end

end
