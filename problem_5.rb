# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def multiple
  num = 20
  until (1..20).all? { |x| num % x == 0 }
    num += 1
  end
  print num
end

multiple