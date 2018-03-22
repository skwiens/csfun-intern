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
    puts sentence
    puts i
    puts j
  end

  return sentence
end





# Call methods
# puts(reverse_in_place('Ada Lovelace'))
# puts(reverse_new_string('Ada Lovelace'))
# puts(reverse_words_new_sentence('I love pizza'))
puts(reverse_words_in_place('I love pizza'))
