=begin
  
Each new term in the Fibonacci sequence is generated by adding the previous two terms. 
By starting with 1 and 2, the first 10 terms will be:
1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
By considering the terms in the Fibonacci sequence whose values do not exceed four million, 
find the sum of the even-valued terms.
  
=end

x = 0
sum = 0

def fib(n)
  return n if n <= 1
  fib(n - 1) + fib(n - 2)
end

while fib(x) < 4000000
  if fib(x) % 2 == 0
    sum += fib(x)
  end
  x += 1
end

print sum


