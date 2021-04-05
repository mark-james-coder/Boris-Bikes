require_relative 'docking_station'
require_relative 'garage'

class Van
  attr_reader :load

  def initialize
    @load = []
  end

  def pickup_station(station)
    @load.push station.broken_bikes.delete_at(0)
  end

  def pickup_garage(garage)
    @load.push garage.workshop.delete_at(0)
  end

end
