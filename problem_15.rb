# Starting in the top left corner of a 2×2 grid, 
# and only being able to move to the right and down, 
# there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

def lattice_paths
  a = (0..19).to_a
  puts a.repeated_combination(a.length).size * 2
end

lattice_paths