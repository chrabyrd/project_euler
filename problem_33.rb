=begin

The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting
to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, 
and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

=end

def curious_fractions(array)
if array[0]/array[1] < 1
    sum = array[0]/array[1].to_f
    numerator = array[0].to_s.split('')
    denominator = array[1].to_s.split('')
    if denominator.any? { |dem| numerator.any? { |num| num == dem }}
      if sum == numerator[0].to_i/denominator[1].to_i.to_f && numerator[1] == denominator[0]
        @num_array << array[0]
        @dem_array << array[1]
      end
    end
  end
end

def all_two_digit_fractions_less_than_one
  (10..99).to_a.repeated_permutation(2) do |ary|
    curious_fractions(ary)
  end
end

def product_of_lowest_common_terms
  @num_array = []; @dem_array = []
  
  all_two_digit_fractions_less_than_one
  num_total = @num_array.inject { |prod, i| prod * i}
  dem_total = @dem_array.inject { |prod, i| prod * i}
  print num_total/dem_total.to_r
end

product_of_lowest_common_terms