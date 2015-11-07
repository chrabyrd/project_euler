# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
# we can see that the 6th prime is 13.
# What is the 10001st prime number?

def find_prime(n)
  (2...n).none? { |i| n % i == 0 }
end

def prime_count
  x = 2
  count = 0
  until count == 10001
    count += 1 if find_prime(x)
    x += 1
  end
  print x - 1
end

prime_count