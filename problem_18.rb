=begin
  
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)
  
=end

@block = 
"75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

def make_arrays
  block = @block.split("\n")
  arrays = block.map { |num| num.split(' ') }
  @num_array = arrays.map { |arr| arr.map { |num| num.to_i } }
end

def sort_array
  @sorted_array = []
  left_branch = @num_array[@y][@x] + @num_array[@y + 1][@x]
  right_branch = @num_array[@y][@x] + @num_array[@y + 1][@x + 1]

  @sorted_array << @choice_1 = left_branch + @num_array[@y + 2][@x]
  @sorted_array << @choice_2 = left_branch + @num_array[@y + 2][@x + 1]
  @sorted_array << @choice_3 = right_branch + @num_array[@y + 2][@x + 1]
  @sorted_array << @choice_4 = right_branch + @num_array[@y + 2][@x + 2]

  @sorted_array.sort!
end

def choose_branch
  if @choice_1 == @sorted_array.last || @choice_2 == @sorted_array.last
    @sum += @num_array[@y + 1][@x]
    @y += 1
  elsif @choice_3 == @sorted_array.last || @choice_4 == @sorted_array.last
    @sum += @num_array[@y + 1][@x + 1]
    @x += 1
    @y += 1
  end
end

def last_choice
  choice_1 = @num_array[@y + 1][@x]
  choice_2 = @num_array[@y + 1][@x + 1]

  if choice_1 > choice_2
    @sum += choice_1
  else
    @sum += choice_2
  end
end

def read_ahead
  make_arrays

  @x = 0; @y = 0; @sum = @num_array[0][0]

  until @y == (@num_array.length - 2)
    sort_array
    choose_branch
    @sorted_array.clear
  end

  last_choice
  puts @sum
end

read_ahead