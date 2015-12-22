=begin
  
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once.
For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

=end

require 'prime'

def pandigital(num)
  str = num.to_s.split('')
  ary = str.map(&:to_i)
  @largest_pandigital = num if (1..str.length).all? { |x| ary.include? (x) }
end

def largest_pandigital
  @largest_pandigital = 0
  (7123456..7654321).each do |num| #My reasoning for this range is that the number needed a 7 to be pandigital, and all pandigital numbers > 7 are divisible by 3 (a number's divisible by 3 if its integer sum is divisible by 3) and therefore not prime.
    if num.prime?
      pandigital(num)
    end
  end
  print @largest_pandigital
end

largest_pandigital