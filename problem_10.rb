# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

@known_primes = []

def eratosthenes_filter(n)
  @array = (2..n).to_a
  Math.sqrt(n).to_i.times do
    prime = @array[0] 
    @array.delete_if { |num| num % prime == 0}
    @known_primes << prime
  end
  sum_primes
end

def sum_primes
  sum = 0
  all_primes = @known_primes + @array
  all_primes.each { |x| sum += x }
  print sum
end


eratosthenes_filter(20)