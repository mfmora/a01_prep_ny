#### Hashes ####

class Hash

  def my_each(&prc)
    self.length.times do |index|
      prc.call(self.keys[index], self.values[index])
    end
  end

  def my_merge(hash2)
  end

end
