=begin 

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; 
for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, 
and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

=end

def split_to_string
  @x_str = @x.to_s.split('')
  @y_str = @y.to_s.split('')
  @xy_str = @y_str + @x_str
end

def is_pandigital?(array)
  @ary << @mult if array.length == array.uniq.length && array.length == 9 && array.none? { |str| str == "0" }
end

def unique_mutiplicand_multiplier
  if @xy_str.length == @xy_str.uniq.length
    @mult = @x * @y
    big_str = @x_str + @y_str + @mult.to_s.split('')
    is_pandigital?(big_str)
  end
end

def pandigital_sum
  @ary = []
  (1..99).each do |x|
    (1..9999).each do |y|
      @x = x; @y = y
      split_to_string
      unique_mutiplicand_multiplier
    end
  end
  print @ary.uniq.inject { |sum, x| sum + x }
end

pandigital_sum