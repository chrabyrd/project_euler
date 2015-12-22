=begin

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.

=end

def factorial_split(i)
  split = i.to_s.split('')
  @split = split.map do |str|
    str = str.to_i
    (1..str).reduce(1, :*)
  end
end

def sum_equal_factorials
  ary = []
  (3..100000).each do |i|
    factorial_split(i)
    ary << i if @split.inject { |sum, x| sum + x } == i
  end
  print ary.reduce(:+)
end

sum_equal_factorials