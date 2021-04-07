require_relative 'docking_station'
require_relative 'garage'
require_relative 'bike_container'

class Van
  attr_reader :load
  attr_reader :capacity

  include BikeContainer

  def initialize(capacity=DEFAULT_CAPACITY)
    @load = []
    @capacity = capacity
  end

  def pickup_station(station)
    @load.push station.broken_bikes.delete_at(0)
  end

  def pickup_garage(garage)
    @load.push garage.workshop.delete_at(0)
  end

end
