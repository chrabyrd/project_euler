# If the numbers 1 to 5 are written out in words: 
# one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

@ones = "one two three four five six seven eight nine".split(' ').map(&:length)
@teens = "eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen".split(' ').map(&:length)
@tens = "twenty thirty forty fifty sixty seventy eighty ninety".split(' ').map(&:length)
@hundred = 7
@hundred_and = 10
@one_thousand = 11

def sum_array(array)
  array.inject { |sum, n| sum + n }
end

def one_to_nineteen
  sum_array(@ones) + sum_array(@teens) + 3 #ten
end

def sum_tens
  sum = 0
  @tens.each { |x| sum += sum_array(@ones) + (x * 10) } #0-9
  return sum
end

def one_to_ninety_nine
  return one_to_nineteen + sum_tens
end

def sum_hundreds
  sum = 0
  @ones.each do |x|
    sum += (x + @hundred) + ((x + @hundred_and) * 99) + one_to_ninety_nine
  end
  return sum
end

def one_to_one_thousand
  print one_to_ninety_nine + sum_hundreds + @one_thousand
end

one_to_one_thousand