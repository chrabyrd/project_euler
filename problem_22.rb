=begin

Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. 
Then working out the alphabetical value for each name, 
multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, 
is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

=end

def alphabetical_order
  string = File.open("p022_names.txt", "rb").read
  @array = string.split(',').sort
end

def letter_values
  alphabetical_order
  value_hash = ("A".."Z").zip(1..26).to_h
  split_name = @array.map {|name| name.split('')}
  @number_array = split_name.map do |name| 
    name.map {|letter| letter = value_hash.values_at(letter)}.flatten.compact
  end
end

def name_score
  letter_values
  sums = @number_array.map do |array| 
    array.inject {|sum, n| sum + n}
  end
  @score = sums.map.with_index {|num, index| num * (index + 1)}
end

def total_score
  name_score
  print @score.inject {|sum, n| sum + n}
end

total_score