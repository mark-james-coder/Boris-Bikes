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
    DEFAULT_CAPACITY.times {subject.dock(bike)}
    expect {subject.dock(bike)}.to raise_error 'Docking station full'
  end

end
