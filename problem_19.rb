=begin

You are given the following information, but you may prefer to do some research for yourself.
1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000

=end

@days_in_month = Hash["January", 31, "February", 28, "March", 31, "April", 30, "May", 31, "June", 30, "July", 31, "August", 31, "September", 30, "October", 31, "November", 30, "December", 31]
year = 1901
@day = 2 # 1 Jan 1901 is a Tuesday
@counter = 0

def monthly_sundays
  @days_in_month.each_value do |n|
    @day += (n % 7)
    @day -= 7 if @day > 6
    @counter += 1 if @day == 0
  end
end

until year == 2001 
  if year % 4 == 0 || year % 400 == 0
    @days_in_month["February"] = 29
  else
    @days_in_month["February"] = 28
  end

  monthly_sundays

  year += 1
end

print @counter