require_relative 'van'
require_relative 'bike'
require_relative 'bike_container'

class Garage
  attr_reader :workshop
  attr_reader :capacity

  include BikeContainer

  def initialize(capacity=DEFAULT_CAPACITY)
    @workshop = []
    @capacity = capacity
  end

  def unload_broken_bikes(van)
    @workshop.push van.load.delete_at(0)
  end

  def repair_bikes
    @workshop.map { |bike| bike.condition = 'working' }
  end
end
