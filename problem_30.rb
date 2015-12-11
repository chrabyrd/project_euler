=begin

Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

=end

def sum_of_fifth_powers
  sum = 0
  (10..1000000).each do |num|
    split = num.to_s.split('')
    powers = split.map { |str| str.to_i ** 5 }
    sum += num if num == powers.inject { |sum,x| sum + x }
  end
  print sum
end

sum_of_fifth_powers