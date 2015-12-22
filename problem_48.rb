=begin

The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

=end

def self_power_addition
  sum = 0
  (1..1000).each do |i|
    sum += i ** i
  end
  array = sum.to_s.split('')
  print array.last(10).join
end

self_power_addition