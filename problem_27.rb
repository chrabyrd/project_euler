=begin
  
Euler discovered the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. 
However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, 
and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

The incredible formula  n² − 79n + 1601 was discovered, 
which produces 80 primes for the consecutive values n = 0 to 79. 
The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n² + an + b, where |a| < 1000 and |b| < 1000

where |n| is the modulus/absolute value of n
e.g. |11| = 11 and |−4| = 4
Find the product of the coefficients, a and b, 
for the quadratic expression that produces the maximum number of primes for consecutive values of n, 
starting with n = 0.

=end

require 'prime'

def consecutive_primes
  n = 0
  loop do
    sum = n**2 + (@a * n) + @b
    break if sum.prime? == false
    if n > @longest_chain
      @longest_chain = n
      @big_a = @a
      @big_b = @b
    end
    n +=1
  end
end

def longest_prime_chain
  @longest_chain = 0; @big_a = 0; @big_b = 0
  (-1000...1000).to_a.repeated_permutation(2).each do |ary|
    @a = ary[0]; @b = ary[1]
    consecutive_primes
  end
  puts " #{@big_a} and #{@big_b} have a prime chain that's #{@longest_chain} digits long. Their product is #{@big_a * @big_b}."
end

longest_prime_chain