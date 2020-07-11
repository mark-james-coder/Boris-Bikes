require 'docking_station.rb'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock(Bike.new)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'docks a bike' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'responds to :bike' do
    expect(subject).to respond_to(:bikes)
  end

  it 'states bike ID' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[0]).to eq(bike)
  end

  it 'raises an error when release bikes that do not exist' do
    expect {subject.release_bike}.to raise_error 'No bikes available'
  end

  it 'raises an error when dock bike if docking station contains a bike' do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
    expect {subject.dock(bike)}.to raise_error 'Docking station full'
  end

  it 'allows user to set docking station capacity' do
    test_num = 25
    station = DockingStation.new(test_num)
    expect(station.capacity).to eq test_num
  end

  it 'sets default docking station default capacity' do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'does not release a broken bike' do
    bike = Bike.new
    bike.report_broken
    station = DockingStation.new
    station.dock(bike)
    expect{station.release_bike}.to raise_error 'Bike is broken'
  end
end
