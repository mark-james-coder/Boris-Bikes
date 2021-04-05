require 'van'
require 'docking_station'
require 'bike'

describe Van do
  it 'picks up broken bikes from docking stations' do
    station = DockingStation.new
    bike = instance_double("bike", :condition => 'broken')
    station.dock bike
    expect(subject.pickup_station(station)[0]).to eq bike
  end
  it 'picks up working bikes from garages' do
    garage = Garage.new
    bike = instance_double("bike", :condition => 'working')
    garage.workshop << bike
    expect(subject.pickup_garage(garage)[0]).to eq bike
  end

end
