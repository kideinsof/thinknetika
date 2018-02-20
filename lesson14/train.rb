class Train
  attr_accessor :wagons
  attr_reader :number, :train_type

  def initialize(number, train_type, wagons)
    @number = number
    @train_type = train_type
    @wagons = wagons
    @speed = 0
  end

  def speed(speed)
    @speed += speed
  end

  def brake
    @speed = 0
  end

  def stopped?
    @speed.zero
  end

  def add_wagon
    return if stopped?
    @wagons += 1
  end

  def delete_wagon
    return if stopped? || @current_station_id.zero?
    @wagons -= 1
  end

  def take_route(route)
    @route = route
    @current_station_id = 0
    current_station
  end

  def move_forward
    @current_station_id = next_station_id
    return if stopped? || (@current_station_id == @route.stations.length - 1)
    current_station
  end

  def move_backward
    @current_station_id = previous_station_id
    return if stopped? || @current_station_id.zero?
    current_station
  end

  def current_station
    @route.stations[@current_station_id]
  end

  def next_station_id
    @current_station_id + 1
  end

  def next_station
    @route.stations[next_station_id]
    @station.train_out(next_station)
  end

  def previous_station_id
    @current_station_id - 1
  end

  def previous_station
    @route.stations[previous_station_id]
  end
end
