=begin

In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?

=end

coins = [0, 1, 2, 5, 10, 20, 50, 100, 200]

def brute_force_count #I've tried for a week to figure out dynamic programming or recursion. Right now only this method works for me.
  (0..200).step(200) do |r|
    (0..200).step(100) do |s|
      (0..200).step(50) do |t|
        (0..200).step(20) do |u|
          (0..200).step(10) do |v|
            (0..200).step(5) do |w|
              (0..200).step(2) do |x|
                (0..200).step(1) do |y|
                  count += 1 if r + s + t + u + v + w + x + y == 200
                end
              end
            end
          end
        end
      end
    end
  end
  print count 
end

brute_force_count