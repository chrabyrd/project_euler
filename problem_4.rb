# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def palindrome
  arr = []
  (100..999).each do |x|
    (100..999).map do |y| 
      x * y
      arr << (x * y) if (x * y).to_s == (x * y).to_s.reverse
    end
  end
  print arr.sort.last
end

palindrome