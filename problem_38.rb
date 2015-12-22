=begin

Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
192 × 2 = 384
192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576. 
We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, 
giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed 
as the concatenated product of an integer with (1,2, ... , n) where n > 1?

=end

def nine_digit_product(i)
  count_up = 1
  ary = []
  until ary.length >= 9
    prod = i * count_up
    split = prod.to_s.split('')
    split.each { |str| ary << str }
    count_up += 1
  end
  @product = ary.map(&:to_i)
end

def pandigital_product?
  pandigital = true
  (1..9).each do |x|
    pandigital = false if @product.include?(x) == false
  end
  pandigital = false if @product.uniq.length != @product.length || @product.length != 9
  return pandigital
end

def largest_pan_product
  largest_pan = 0
  (1..100000).each do |x|
    nine_digit_product(x)
    largest_pan = @product.join.to_i if pandigital_product? && @product.join.to_i > largest_pan
  end
  puts "The largest pandigital product is #{largest_pan}."
end

largest_pan_product