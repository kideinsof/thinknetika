puts 'назовите ваше имя'
name = gets.chomp
puts 'введите ваш рост'
height = gets.to_i
weight = height - 110
if weight < 0
  puts 'ваш вес уже оптимальный'
else
  puts 'идеальный вес составляет #{weight}'
end
