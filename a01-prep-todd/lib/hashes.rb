#### Hashes ####

class Hash

  def my_each(&prc)
    self.length.times do |index|
      prc.call(self.keys[index], self.values[index])
    end
  end

  def my_merge(hash2)
    merged = hash2.dup

    self.each do |key,value|
      merged[key] = value unless merged[key]
    end
    merged
  end

end
