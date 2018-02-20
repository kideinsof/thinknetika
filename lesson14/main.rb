load './route.rb'
load './station.rb'
load './train.rb'

train=Train.new(45-63,"repair",5)
train.speed(50)

train.add_wagon
train.add_wagon

train.add_wagon
train.brake
train.wagons
train.speed(20)

route = Route.new("first","last")
route.insert_station("second")
route.insert_station("third")
route.insert_station("fourh")
train.take_route(route)

train.move_forward
train.move_forward


# train.cur
