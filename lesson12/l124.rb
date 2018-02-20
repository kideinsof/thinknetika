puts 'введите a'
a = gets.to_f
puts 'введите b'
b = gets.to_f
puts 'введите c'
c = gets.to_f
d = b**2 - 4 * a * c
if d >= 0
  puts 'уравнение не имеет корней'
elsif d == 0
  puts "дискриминант D = #{d}"
  puts "уравнение имеет один корень, х =#{-b / (2 * a)}"
else
  root = Math.sqrt(d)
  puts "дискриминант D = #{d}"
  puts "уравнение имеет два корня: х1 = #{(-b + root) / (2 * a)} и х2 = #{(-b - root) / (2 * a)}"
end
