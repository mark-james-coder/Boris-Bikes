require_relative 'bike'
require_relative 'van'
require_relative 'bike_container'

class DockingStation
  attr_reader :capacity
  attr_reader :bikes
  attr_reader :broken_bikes

  include BikeContainer

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    if bike.respond_to?(:condition)
      if bike.condition == 'working'
        bikes << bike
      else
        broken_bikes << bike
      end
    else
      fail 'Only bikes can be docked'
    end
  end

  def unload_repaired_bikes(van)
    @bikes.push van.load.delete_at(0)
  end


private

 def full?
   bikes.length >= capacity
 end

 def empty?
   bikes.empty?
 end

 def broken?
   bikes[-1].condition == 'broken'
 end

end
