class Train
  attr_reader :train_number, :speed, :wagons

  def initialize(values = {})
    @train_number = values[:train_number]
    @train_type = values[:train_type] || def_train_type
    @speed = values[:speed] || 0
    @wagons = []
  end

  def def_train_type
    raise NotImplementedError
  end

  def add_speed(speed)
    @speed += speed
  end

  def increase_speed(speed)
    @speed -= speed if (@speed > 0) && (@speed > speed)
  end

  def add_wagon(wagon_type)
    @wagons << wagon_type if stopped?
  end

  def delete_wagon
    @wagons.pop if stopped?
  end

  def take_route(route)
    @route = route
    @station_id = 0
    current_station
    @route.stations[@station_id]
  end

  def move_next_station
    return if stopped?
    current_station.delete_train(self)
    next_station.add_train(self)
    @station_id += 1
  end

  def move_previous_station
    return if stopped?
    current_station.delete_train(self)
    previous_station.add_train(self)
    @station_id -= 1
  end

  private

  def stopped?
    @speed.zero?
  end

  def current_station
    @route.stations[@station_id]
  end

  def next_station
    @route.stations[@station_id + 1]
  end

  def previous_station
    @route.stations[@station_id - 1]
  end
end
