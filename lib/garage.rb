require_relative 'van'
require_relative 'bike'

class Garage
  attr_reader :workshop

  def initialize
    @workshop = []
  end

  def unload_broken_bikes(van)
    @workshop.push van.load.delete_at(0)
  end

  def repair_bikes
    @workshop.map { |bike| bike.condition = 'working' }
  end
end
