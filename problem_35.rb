=begin

The number, 197, is called a circular prime because all rotations of the digits: 
197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

=end

require "prime"

def circular_primes(i)
  prime = true
  split = i.to_s.split('')
  (split.length - 1).times do 
    split = split.rotate.map(&:to_i)
    rotated_number = split.join.to_i
    prime = false if rotated_number.prime? == false
  end
  @counter += 1 if prime == true
end

def all_primes
  @counter = 0
  (1...1000000).each do |i|
    circular_primes(i) if i.prime?
  end
  print @counter
end

all_primes