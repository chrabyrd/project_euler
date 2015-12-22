=begin

The number 3797 has an interesting property. Being prime itself, 
it is possible to continuously remove digits from left to right, 
and remain prime at each stage: 3797, 797, 97, and 7. 
Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

=end

require 'prime'

def drop_left(i)
  split = i.to_s.split('')
  until split.length == 1
    split = split.drop(1)
    @prime = false if split.join.to_i.prime? == false
  end
end

def drop_right(i)
  split = i.to_s.split('')
  until split.length == 1
    split.pop
    @prime = false if split.join.to_i.prime? == false
  end
end

def prime_list
  array = []
  (11..1000000).each do |i|
    @prime = true
    if i.prime?
      drop_left(i)
      drop_right(i)
      array << i if @prime == true
    end
  end
  print array.inject { |sum, x| sum + x }
end

prime_list