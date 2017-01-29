#### Strings ####
require 'byebug'
# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize(title)
  connectors = %w(a and of over the)
  title.capitalize!
  title.split.map do |word|
    if connectors.include?(word)
      word
    else
      word[0].upcase + word[1..-1]
    end
  end.join(" ")
end

# Write a method that translates a sentence into pig latin. You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
def translate(sentence)
  vowel = %w(a e i o u)
  sentence.split.map do |word|
    if vowel.include?(word[0])
      word + "ay"
    else
      index = 0
      next_letter = word[index]
      until vowel.include?(next_letter)
        index += 1
        next_letter = word[index]
      end
      index += 1 if word[index - 1] == "q"
      word[index..-1] + word[0...index] + "ay"
    end
  end.join(" ")

end

# Write a method that caesar shifts a string by a number of shifts
# You can ssume all characters are lowercase
def caesar_cipher(str, shift)
  result = []
  letters = ("a".."z").to_a
  str.split("").each do |letter|
    if letter == " "
      result << letter
    else
      new_letter = (letters.index(letter) + shift) % 26
      result << letters[new_letter]
    end
  end
  result.join
end

# Write a method that sorts the characters in a string according to the order of an alphabet array
# Use alphabetical order by default if an alphabet is not provided
def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a
  array = str.split("")
  array.sort do |letter1, letter2|
    alphabet.index(letter1) <=> alphabet.index(letter2)
  end.join("")
end

class String

  # Write a method that returns all subwords within a string that are included in a dictionary array
  def real_words_in_string(dictionary)
  end

  # Write a method that returns all substrings that are also palindromes
  def symmetric_substrings
  end

end
