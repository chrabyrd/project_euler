=begin

The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?

=end

require 'prime'

def prime_factors
  @prime_factors = []
  (1..500000).each do |i|
    primes = Prime.prime_division(i)
    @prime_factors << i if primes.length == 4
  end
end

def smallest_consecutive
  prime_factors
  @prime_factors.each_cons(4) do |ary|
    if ary[1] == ary[0] + 1 && ary[2] == ary[1] + 1 && ary[3] == ary[2] + 1
      print ary
      exit
    end
  end
end

smallest_consecutive