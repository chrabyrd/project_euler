=begin

The nth term of the sequence of triangle numbers is given by, 
tn = ½n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its 
alphabetical position and adding these values we form a word value. 
For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. 
If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), 
a 16K text file containing nearly two-thousand common English words, how many are triangle words?

=end

def workable_array
  string = File.open("p042_words.txt", "rb").read
  @array = string.split(',')
end

def letter_values
  workable_array
  value_hash = ("A".."Z").zip(1..26).to_h
  split_word = @array.map {|word| word.split('')}
  @number_array = split_word.map do |word| 
    word.map {|letter| letter = value_hash.values_at(letter)}.flatten.compact
  end
end

def word_score
  letter_values
  @number_array.each do |ary|
    sum = ary.inject { |sum, x| sum + x }
    @triangle_words += 1 if @triangles.any? { |i| i == sum }
  end
end

def triangle_number
  @triangles = []; value = 1; count = 2
  until @triangles.length == 100
    @triangles << value
    value += count
    count += 1
  end
end

def number_of_triangle_words
  @triangle_words = 0
  triangle_number
  word_score
  print @triangle_words
end

number_of_triangle_words