=begin
  
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?

=end

require 'prime'

def prime_sum(i)
  array = Prime.first(1000).to_a
  array.each_cons(i) do |ary|
    sum = ary.inject { |sum, x| sum + x }
    if sum.prime? && sum < 1000000
      puts "The prime sum: [#{sum}] is made by adding #{ary.length} consecutive primes."
    end
  end
end

def longest_sum
  (1..1000).each do |num|
    prime_sum(num)
  end
end

longest_sum