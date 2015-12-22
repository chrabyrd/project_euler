=begin

An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

=end

def irrational_decimal
  @decimal_array = []
  (0..200000).each do |i|
    split = i.to_s.split('')
    split.each { |str| @decimal_array << str }
  end
end

def product
  mult_array = []
  x = 1
  until x == 10000000
    mult_array << @decimal_array[x].to_i
    x *= 10
  end
  print mult_array.inject { |prod, x| prod * x }
end

def timer # The first iteration of this script took to long.
  start = Time.now
  irrational_decimal
  product
  finish = Time.now - start
  puts " That took #{finish} seconds."
end

timer