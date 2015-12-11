=begin

A unit fraction contains 1 in the numerator. 
The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1

Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

=end
def real_to_split_whole_num(n)
  whole_num = 10**2000/n
  @arr = whole_num.to_s.split('')
end

def find_pattern(n)
  x = 1
  until x == 1000
    @slice = @arr.each_slice(x).to_a
    if @slice[0] == @slice[1] && x > @denominator
      @denominator = n
      @pattern_length = x
    end
    break if @slice[0] == @slice[1]
    x += 1
  end
end

def longest_patterns
  @denominator = 0; @pattern_length = 0
  (2...1000).each do |n| 
    real_to_split_whole_num(n)
    find_pattern(n)
  end
  puts "1/#{@denominator} has the longest pattern, which is #{@pattern_length} digits long!"
end

longest_patterns