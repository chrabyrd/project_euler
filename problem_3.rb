# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

def prime_factor(n, arr = [])
  (2...n).each do |x| 
    arr << x if n % x == 0 && (2...x).all? { |i| x % i != 0 }
  end
  print arr[-1]
end

prime_factor(600851475143)