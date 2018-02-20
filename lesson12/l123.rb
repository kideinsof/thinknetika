puts 'введите первую сторону треугольника'
a = gets.to_f
puts 'введите вторую сторону треугольника'
b = gets.to_f
puts 'введите третью сторону треугольника'
c = gets.to_f
sides = [a, b, c].sort
if sides[2]**2 == sides[0]**2 + sides[1]**2
  puts 'треугольник прямоугольный'
else
  puts 'треугольник непрямоугольный'
end
message =
  case sides.uniq.length
  when 1 then 'треугольник равносторонний'
  when 2 then 'треугольник равнобедренный'
  end
puts message
