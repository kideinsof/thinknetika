abc = ('a'..'z')
abc_sort = {}
key = 'aeiouy'
abc.each.with_index { |value, i| abc_sort[value] = i + 1 if key.include? (value) }
puts abc_sort
