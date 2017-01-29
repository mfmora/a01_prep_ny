require 'byebug'
class Array
  def my_each(&prc)
    self.length.times do |index|
      prc.call(self[index])
    end
  end

  def my_each_with_index(&prc)
    self.length.times do |index|
      prc.call(self[index],index)
    end
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
    self.my_each do |el|
      result &&= prc.call(el)
    end
    result
  end

  def my_zip(*arrs)
    zipped = []
    self.each_with_index do |el,index|
      zip = [el]
      arrs.each do |array|
        zip << array[index]
      end
      zipped << zip
    end
    zipped
  end

  def my_rotate(num = 1)
    result = []
    self.each_with_index do |el,index|
      new_index = (index - num) % self.length
      result[new_index] = el
    end
    result
  end

  def my_join(str = "")
    result = ""
    self.each do |el|
      result += el.to_s
      result += str unless el == self.last
    end
    result
  end

  def my_reverse
    result = []
    self.each {|el| result.unshift(el)}
    result
  end

  def my_inject(acc = nil, &prc)
    acc = self.shift if acc.nil?

    self.each do |el|
      acc = prc.call(acc,el)
    end
    acc
  end

  def my_flatten
    result = []
    self.each do |el|
      el.is_a?(Array) ? result.concat(el.my_flatten) : result << el
    end
    result
  end

  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end
end

# Write a method that returns an array of all of the pairs of indexes whose
# elements sum to zero

class Array
  def two_sum
    result = []
    (0...self.length-1).each do |first|
      (first+1...self.length).each do |last|
        result << [first, last] if self[first] + self[last] == 0
      end
    end
    result
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def primes(num)
  result = []
  count = 2
  until result.length == num
    result << count if is_prime?(count)
    count += 1
  end
  result
end

def is_prime?(num)
  (2...num).none? {|n| num % n == 0}
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**

def digital_root(num)
  return num if num < 10

  result = digits(num).inject(:+)
  result > 9 ? digital_root(result) : result
end

def digits(num)
  return [num] if num < 10
  result = [num % 10]
  result.concat(digits(num/10))
end

# Write a function sum_to(n) that uses recursion to calculate the sum from
# 1 to n (inclusive of n).

def sum_to(n)

end

# Write a function add_numbers(nums) that takes in an array of Fixnums and
# returns the sum of those numbers. Write this method recursively.

def add_nums(nums)

end

# Let's write a method that will solve Gamma Function recursively. The Gamma
# Function is defined Γ(n) = (n-1)!.

def gamma_fnc(n)

end

# Return an array of all numbers in the range, excluding max (recursive)

def range(min, max)

end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(n)

end

def fibs_rec(n)

end

# return b^n recursively. Accept negative value for n

def exponent(base, exp)

end

class Array
  def deep_dup

  end

  # Def will not be on the assessment
  # def subsets
  #
  # end

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups

  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings

  end

  def substrings

  end
end

class Array
  def merge_sort(&prc)

  end

  def self.merge(left, right, &prc)

  end

  def quick_sort(&prc)

  end

  def bsearch(target)

  end
end
