class Station
  attr_reader :station_name, :trains

  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end

  def train_in(train)
    @trains << train
  end

  def train_out(train)
    @trains.delete train
  end

  def train_type(train_type)
    trains.select { |train| train.is_a? [train_type] }
  end
end
