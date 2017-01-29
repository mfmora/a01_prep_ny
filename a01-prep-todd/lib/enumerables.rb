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
    result = []
    self.my_each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |el|
      result << el unless prc.call(el)
    end
    result
  end

  def my_any?(&prc)
    result = false
    self.my_each do |el|
      result ||= prc.call(el)
    end
    result
  end

  def my_all?(&prc)
    result = true
    self.my_each { |el| result &&= prc.call(el)}
    result
  end

  def my_flatten
    result = []
    self.each do |el|
      el.is_a?(Array) ? result.concat(el.my_flatten) : result << el
    end
    result
  end

  # Write a version of flatten that only flattens n levels of an array.
  def my_controlled_flatten(n)
    result = []
    self.each do |el|
      if n > 0 && el.is_a?(Array)
        result.concat(el.my_controlled_flatten(n - 1))
      else
        result << el
      end
    end
    result
  end

  def my_zip(*arrs)
    result = []
    self.each_with_index do |el,index|
      inside = [el]
      arrs.each {|sub_el| inside << sub_el[index]}
      result << inside
    end
    result
  end

  def my_rotate(num=1)
  end

  def my_join(str = "")
  end

  def my_reverse
  end

end
