# Design and implement a method to reverse a string:
def reverse_in_place(string)
  i = 0
  j = string.length - 1
  while i < j
    temp = string[i]
    string[i] = string[j]
    string[j] = temp
    i += 1
    j -= 1
  end
  return string
end
# Time Complexity: O(n)
# Space Complexity: O(1)

def reverse_new_string(string)
  reverse_string = ""
  puts reverse_string
  i = string.length - 1
  while i >= 0
    reverse_string += string[i]
    i -= 1
  end
  return reverse_string
end
# Time Complexity: O(n)
# Space Complexity: O(1)

# Using an Array (not in place)
def reverse_words_new_sentence(sentence)
  sentence_array = sentence.split(' ')
  sentence_array.each do |word|
    reverse_in_place(word)
  end
  return sentence_array.join(' ')
end


def reverse_words_in_place(sentence)
  puts sentence.length
  i = 0
  j = 0

  while sentence[j] != nil
    while !(sentence[j+1] == " " || sentence[j+1] == nil)
      j += 1
      puts sentence[j]
      puts "j=#{j}"
    end

    sentence[i..j] = reverse_new_string(sentence[i..j])

    j += 1

    while sentence[j] == " "
      j += 1
    end

    i = j
  end

  return sentence
end

# Design and implement a method to reverse the words in a sentence, in place.
def reverse_sentence(sentence)
  return reverse_words_in_place(reverse_in_place(sentence))
end

# Design and implement a method to check if the input string is a palindrome. Return true if the string is a palindrome. Return false otherwise.
def palindrome?(string)
  i = 0
  j = string.length - 1

  while i < j
    while string[i] == " "
      i += 1
    end
    while string[j] == " "
      j -= 1
    end
    if string[i].downcase != string[j].downcase
      return false
    else
      i += 1
      j -= 1
    end
  end

  return true
end


# Design and implement a method that updates the string by replacing consecutive repeating characters with a number representing the frequncy. The replacement is done only if the string length will get reduced by the process. In addition to .length, you may use .slice! to implement this method.

# e.g "aaabbbbbcccc" will get replace to "a3b5c4", since a is repeated 3 times, b is repeated 5 times and c is repeated 4 times
# "xxxyttttgeee" will get replaced with "x3yt4ge3". 'y' and 'g' do not get replaced by "y1" and "g1" since that will increase the length.
# "ddbbfffgjjjj" will get replaced with "ddbbf3gj4". "dd" and "bb" do not get replaced since the length will remain the same with "d1" and "b1". "g" does not get replaced with "g1" since that will increase the length.

def update(string)
  compare = 0
  current = 1
  count = 1

  while compare < string.length
    while string[current] == string[compare]
      count += 1
      current += 1
      if count > 1
        string.slice!(current)
      end
    end

    if count > 1
      string[compare + 1] = count.to_s
    end

    compare = current
    current += 1
    count = 1
  end

  return string
end




# Call methods
# puts(reverse_in_place('Ada Lovelace'))
# puts(reverse_new_string('Ada Lovelace'))
# puts(reverse_words_new_sentence('I love pizza'))
puts(update('aaabbbbbcccc'))
