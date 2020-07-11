require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike is broken' if @bikes[-1].broken?
    @bikes.pop
  end
  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end
  private
  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end
  def empty?
    @bikes.count == 0
  end
end
