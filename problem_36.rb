=begin

The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)

=end

def base_2_palindromes(i)
  @ary << i if i.to_s(2) == i.to_s(2).reverse
end

def base_10_palindromes
  @ary = []
  (1...1000000).each do |i|
    base_2_palindromes(i) if i.to_s.split('') == i.to_s.split('').reverse
  end
  print @ary.inject { |sum, x| sum + x }
end

base_10_palindromes