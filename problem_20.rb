# n! means n × (n − 1) × ... × 3 × 2 × 1
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!

def hundred_factorial
  (1..100).inject { |product, n| product *= n }
end

def sum_of_digits
  ary = hundred_factorial.to_s.split('')
  sum = 0
  ary.each do |s|
    s = s.to_i
    sum += s
  end
  print sum
end

sum_of_digits