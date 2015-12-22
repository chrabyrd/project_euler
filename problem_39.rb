=begin

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, 
there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?

=end

def find_side_length(p)
  @count = 0
  (1..(p/2)).to_a.combination(3) do |i|
    @count += 1 if i[0] + i[1] + i[2] == p && i[0] ** 2 + i[1] ** 2 == i[2] ** 2
  end
end

def count_up
  max_solutions = 0
  max_perimeter = 0
  (1..1000).each do |p|
    find_side_length(p)
    if @count > max_solutions
      max_solutions = @count 
      max_perimeter = p
    end
  end
  puts "For a perimeter of p = #{max_perimeter}, there are #{max_solutions} possible combinations of side length."
end

count_up