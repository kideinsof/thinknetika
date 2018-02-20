class Route
  attr_accessor :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def insert_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def print_stations
    puts @stations
  end
end
