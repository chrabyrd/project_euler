# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, 
# then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

def sum_divisors
  @array = []
  1.upto(10000) do |x|
    sum = (1...x).inject { |sum, n| x % n == 0 ? sum + n : sum }
    @array << [x, sum]
  end
end

def amicable_sum
  sum_divisors
  @array.keep_if do |ary| 
    @array.any? { |num| ary[0] == num[1] && ary[1] == num[0] && ary[0] != ary[1] }
  end
  print @array.inject(:+).uniq.inject(:+)
end

amicable_sum