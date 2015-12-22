=begin

It was proposed by Christian Goldbach that every odd composite number can be written 
as the sum of a prime and twice a square.

9 = 7 + 2×12
15 = 7 + 2×22
21 = 3 + 2×32
25 = 7 + 2×32
27 = 19 + 2×22
33 = 31 + 2×12

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

=end

require 'prime'

def composite_odd_list
  @com_odd = []
  (2..6000).each do |i|
    @com_odd << i if i.odd? && i.prime? == false
  end
end

def goldbach_list
  @goldbach_array = []
  @com_odd.each do |comp|
    primes = Prime.first comp
    primes.each do |prime|
      (1..Math.sqrt(comp)).each do |squ|
        if prime < comp
          @goldbach_array << comp if prime + (2 * (squ ** 2)) == comp
        end
      end
    end
  end
end

def find_non_goldbach
  smallest = 6000
  composite_odd_list
  goldbach_list
  goldbach_array = @goldbach_array.uniq
  @com_odd.each do |comp|
    smallest = comp if goldbach_array.include?(comp) == false && comp < smallest
  end
  puts smallest
end

find_non_goldbach