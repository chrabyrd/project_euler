=begin 

The following iterative sequence is defined for the set of positive integers:
n → n/2 (n is even)
n → 3n + 1 (n is odd)
Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
Which starting number, under one million, produces the longest chain?
NOTE: Once the chain starts the terms are allowed to go above one million.

=end

def collatz(n)
  @sum = 1
  until n == 1
    if n.even?
      n = n / 2
      @sum += 1
    elsif n.odd?
      n = 3 * n + 1
      @sum += 1
    end
  end
  @sum
end

def long_chain
  x = 1
  longest_chain = 0
  starting_number = 0
  until x == 999999
    collatz(x)
    if @sum > longest_chain
      longest_chain = @sum
      starting_number = x
    end
    x += 1
  end
  print starting_number
end

long_chain