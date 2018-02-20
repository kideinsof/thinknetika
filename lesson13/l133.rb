array = [0]
i = 0
fibo = 1
while fibo < 100
  i += 1
  array << fibo
  fibo = array[i] + array[i - 1]
end
puts array
