require 'docking_station.rb'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'docks a bike' do
    expect(subject).to respond_to(:dock).with(1).argument
  end
  it 'responds to :bike' do
    expect(subject).to respond_to(:bike)
  end
  it 'states bike ID' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end
end
