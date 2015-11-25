# 2 ** 15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2 ** 1000?

def power_sum
  num_ary = []
  ary = (2 ** 1000).to_s.split('') # Because of BigNum
  ary.each { |x| num_ary << x.to_i }
  print num_ary.inject { |sum, x| sum + x }
end

power_sum