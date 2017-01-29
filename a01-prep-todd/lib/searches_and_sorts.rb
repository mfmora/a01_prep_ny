#### Searches && Sorts ####
require 'byebug'
class Array
  def bubble_sort!
    sorted = false
    until sorted
      sorted = true
      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if self[i] > self[j]
          self[i],self[j] = self[j],self[i]
          sorted = false
        end
      end
    end
    self
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |x,y| x <=> y}
    sorted = false
    until sorted
      sorted = true
      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if prc.call(self[i],self[j]) == 1
          self[i],self[j] = self[j],self[i]
          sorted = false
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new { |x,y| x <=> y}
    middle = self.length/2
    lef_sorted = self.take(middle).merge_sort(&prc)
    right_sorted = self.drop(middle).merge_sort(&prc)
    Array.merge(lef_sorted, right_sorted, &prc)
  end

  def self.merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty?
      if prc.call(left.first,right.first) == 1
        sorted << right.shift
      else
        sorted << left.shift
      end
    end
    sorted + left + right
  end

  def my_quick_sort(&prc)
    #select pivot as the first one
    #take all the elements that are smaller than pivot to the left
    #take the big ones to the right
    #sort each one of them
    #return when your array is one or less
    return self if self.length <= 1

    prc ||= Proc.new { |x,y| x <=> y}

    pivot = self.first
    left = self.drop(1).select {|n| prc.call(pivot,n) == 1}
    right = self.drop(1).select { |n| prc.call(pivot,n) != 1}

    left.my_quick_sort(&prc) + [pivot] + right.my_quick_sort(&prc)
  end

  def my_bsearch(target, &prc)
    return nil if self.empty?
    prc ||= Proc.new {|x,y| x <=> y}

    middle = self.length/2
    return middle if prc.call(self[middle],target) == 0

    if prc.call(self[middle],target) == 1
      result = self.take(middle).my_bsearch(target, &prc)
      return result unless result.nil?
    else
      result = self.drop(middle + 1).my_bsearch(target, &prc)
      return result + 1 + middle unless result.nil?
    end
    nil
  end
end
