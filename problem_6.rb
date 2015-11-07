=begin

The sum of the squares of the first ten natural numbers is,
1**2 + 2**2 + ... + 10**2 = 385
The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)**2 = 55**2 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers 
and the square of the sum is 3025 − 385 = 2640.
Find the difference between the sum of the squares of the first one hundred natural numbers 
and the square of the sum.

=end

def sum_sqare
  sum = 0
  (1..100).each do |x|
    sum += x ** 2
  end
  @su_s = sum
end

def square_sum
  sum = 0
  (1..100).each do |x|
    sum += x
  end
  @sq_s = sum ** 2
end

def difference
  sum_sqare
  square_sum
  print @sq_s - @su_s
end

difference