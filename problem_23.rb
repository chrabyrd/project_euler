=begin

A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, 
which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n 
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
the smallest number that can be written as the sum of two abundant numbers is 24. 
By mathematical analysis, it can be shown that all integers greater than 28123 
can be written as the sum of two abundant numbers. 
However, this upper limit cannot be reduced any further by analysis
even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers 
is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

=end

def abundant_numbers
  @abundant = []
  2.upto(28123) do |x|
    sum = (1...x).inject {|sum, n| x % n == 0 ? sum + n : sum}
    @abundant << x if sum > x
  end
end

def sums_of_the_abundants
  abundant_numbers
  sums = @abundant.repeated_combination(2).map{|ary| ary[0] + ary[1]}.uniq
  @abundant_sums = sums.delete_if {|n| n > 28123}
end

def sum_non_abundant_numbers
  sums_of_the_abundants
  numbers = (1..28123).to_a
  numbers.delete_if {|n| @abundant_sums.include?(n)}
  print numbers.inject {|sum, n| sum + n}
end

sum_non_abundant_numbers