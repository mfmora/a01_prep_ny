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
  end

  def self.merge(left, right, &prc)
  end

  def my_quick_sort(&prc)
  end

  def my_bsearch(target, &prc)
  end
end
