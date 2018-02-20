months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
days = 0
i = 0

puts 'введите текущую дату в формате'
print 'dd : '
day = gets.to_i
print 'mm : '
month = gets.to_i
print 'yyyy : '
year = gets.to_i
months [1] = 29 if ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)
loop do
  break if i == month - 1
  days += months[i]
  i += 1
end
days += day
puts days
