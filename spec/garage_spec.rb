require 'garage'
require 'bike'

describe Garage do
  it 'unloads broken bikes from a van into its workshop ' do
    bike = instance_double("bike", :condition => 'broken')
    van = instance_double("van", :load => [bike])
    subject.unload_broken_bikes(van)
    expect(subject.workshop[0]).to eq bike
  end
  it 'repairs broken bikes' do
    bike = Bike.new
    bike.report_broken
    subject.workshop << bike
    subject.repair_bikes
    expect(subject.workshop[0].condition).to eq 'working'
  end
end
