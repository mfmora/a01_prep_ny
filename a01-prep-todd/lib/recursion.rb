require 'byebug'
#### Recursion ####

# Write a recursive method that returns the first "num" factorial numbers.
def digital_root(num)
  return num if num < 10

  result = digits(num).inject(:+)
  result > 9 ? digital_root(result) : result
end

def digits(num)
  return [num] if num < 10
  result = [num%10]
  result.concat(digits(num/10))
end

# Write a recursive method that returns an array of first n number of factorials
def factorials_rec(num)
  return [1] if num == 1

  factorials_rec(num - 1) << (1..num-1).inject(:*)
end

# Write a recursive method that returns an array of numbers between min and max
def range(min, max)
  return [] if min >= max - 1
  result = [min+1]
  result.concat(range(min+1,max))
end

# Write a recursive method that returns the sum of all elements in an array
def sum(nums)
  result = 0
  nums.each { |el| result += el}
  result
end

# Write a recursive method that exponentiates base ** power without using the ** method
def exp(base, power)
  return 1 if power == 0

  base * exp(base,power-1)
end

# Write a recursive method that deep dups an array
class Array
  def deep_dup
    self.map {|el| el.is_a?(Array) ? el.deep_dup : el}
  end
end

# Write a recursive method that returns the first n number of fibonacci numbers in an array
def fibs_rec(n)
  return [0] if n == 1
  return [0,1] if n == 2

  fib = fibs_rec(n -1)
  fib << fib[-1] + fib[-2]
end

# Write a recursive method subsets that will return all subsets of an array.
class Array
  def subsets
    return [[]] if self.length == 0

    subs = self.take(self.length-1).subsets
    subs + subs.map {|el| el + [self.last] }
  end
end

# Write a recursive method that returns all of the permutations of an array
def permutations(array)
  return [array] if array.length == 1

  results = []
  array.each_with_index do |el,index|
    perms = permutations(array.take(index)+array.drop(index+1))
    results += perms.map { |per| [el] + per}
  end
  results
end

# Write a recursive method that returns an array of the best change given a target amouunt
def make_change(target, coins = [25, 10, 5, 1])
  # Don't need any coins to make 0 cents change
  return [] if target == 0
  # Can't make change if all the coins are too big. This is in case
  # the coins are so weird that there isn't a 1 cent piece.
  return nil if coins.none? { |coin| coin <= target }

  # Optimization: make sure coins are always sorted descending in
  # size. We'll see why later.
  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    # can't use this coin, it's too big
    next if coin > target

    # use this coin
    remainder = target - coin

    # Find the best way to make change with the remainder (recursive
    # call). Why `coins.drop(index)`? This is an optimization. Because
    # we want to avoid double counting; imagine two ways to make
    # change for 6 cents:
    #   (1) first use a nickel, then a penny
    #   (2) first use a penny, then a nickel
    # To avoid double counting, we should require that we use *larger
    # coins first*. This is what `coins.drop(index)` enforces; if we
    # use a smaller coin, we can never go back to using larger coins
    # later.
    best_remainder = make_change(remainder, coins.drop(index))

    # We may not be able to make the remaining amount of change (e.g.,
    # if coins doesn't have a 1cent piece), in which case we shouldn't
    # use this coin.
    next if best_remainder.nil?

    # Otherwise, the best way to make the change **using this coin**,
    # is the best way to make the remainder, plus this one coin.
    this_change = [coin] + best_remainder

    # Is this better than anything we've seen so far?
    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  best_change
end

# Write a recursive method that takes a Fixnum and converts it to a string in a different base
# Do not use the built-in #to_s(base) method.
# |Base 10 (decimal)     |0   |1   |2   |3   |....|9   |10  |11  |12  |13  |14  |15  |
# |Base 2 (binary)       |0   |1   |10  |11  |....|1001|1010|1011|1100|1101|1110|1111|
# |Base 16 (hexadecimal) |0   |1   |2   |3   |....|9   |A   |B   |C   |D   |E   |F   |

class Fixnum
  def stringify(base)
    return "" if self == 0
    result = "#{(self % base).translate}"
    "#{(self/base).stringify(base)}" + result
  end

  def translate
    if self > 9
      letters = ("a".."z").to_a
      letters[self-10]
    else
      self
    end
  end
end

# Write a recursive method that returns the sum of the first n even numbers
def first_even_numbers_sum(n)
end
