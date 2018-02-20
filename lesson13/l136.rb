goods = {}
total_price = 0
i = 1
puts 'заполните пулл покупок, для окончания в графе "название товара" введите "stop"'
loop do
  print "введите название #{i}-го дорогостоящего товара : "
  name = gets.chomp
  break if name == 'stop'
  print 'введите цену за мешочек, в особо ценной валюте : '
  price = gets.to_f
  print 'введите кол-во купленного товара, в мешках : '
  quantity = gets.to_f
  goods[name] = {'price' => price, 'quantity' => quantity}
  total_price += price * quantity
  i += 1
end
puts "продуктовая корзина: #{goods}"
goods.each do |product_name, position_info|
  total_price = position_info['price'] * position_info['quantity']
  puts "куплено товара #{product_name} на #{total_price} единиц валюты"
end
puts "протранжирено #{total_price} единиц валюты"
