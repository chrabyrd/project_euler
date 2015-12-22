=begin 

The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, 
is unusual in two ways: (i) each of the three terms are prime, and, 
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, 
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?

=end

require 'prime'

def prime_permutations(i)
  @prime_perm = []
  if i.prime?
    perm_ary = i.to_s.split('').permutation.to_a
    perm_ary.each do |perm|
      @prime_perm << perm.join if perm.join.to_i.prime?
    end
  end
end

def sequence
  (1000..9999).each do |num|
    increase_amount = 0; diff_ary = []
    prime_permutations(num)
    array = @prime_perm.uniq.map(&:to_i)
    array.permutation(2).each { |ary| diff_ary << ary[1] - ary[0] if ary[0] == array[0] }
    diff_ary.each { |x| diff_ary.any? { |y| increase_amount = x if y == x * 2 && x > 0 } }
    puts "The answer is: #{array[0]}#{array[0].to_i + increase_amount}#{array[0].to_i + (increase_amount * 2)}" unless increase_amount == 0
  end
end

sequence