class Bike
  attr_accessor :condition

  def initialize
    @condition = 'working'
  end

  def report_broken
    @condition = 'broken'
  end

end
