=begin

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

=end

def correct_combo
  @correct_order = []
  numbers = (1..500).to_a
  pattern_array = numbers.combination(3).to_a
  pattern_array.each { |x| @correct_order <<  x if x[0] < x[1] && x[1] < x[2] }
end

def find_triplets
  correct_combo
  @correct_order.each do |y|
    print y[0]*y[1]*y[2] if (y[0] ** 2) + (y[1] ** 2) == (y[2] ** 2) && y[0] + y[1] + y[2] == 1000
  end
end

find_triplets