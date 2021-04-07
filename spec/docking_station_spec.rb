require 'docking_station'
require 'bike'
require 'support/shared_examples_for_bike_container'

describe DockingStation do

  let(:bike) { double :bike }

  describe '#release_bike' do
    it 'releases a bike' do
      allow(bike).to receive(:condition).and_return('working')
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases a working bike' do
      # subject.dock Bike.new
      allow(bike).to receive(:condition).and_return('working')
      subject.dock bike
      expect(subject.release_bike.condition).to eq 'working'
      end

    it 'does not release a broken bike' do
      # bike = Bike.new
      bike = instance_double("bike", :condition => 'broken')
      subject.dock bike
      expect { subject.release_bike }.to raise_error 'No bikes available'
      end
  end

  describe '#dock' do
    it 'docks a bike' do
      allow(bike).to receive(:condition).and_return('working')
      expect(subject.dock(bike)[0]).to eq bike
    end
    it 'when docking, it separates broken bikes from working bikes' do
      bike = instance_double("bike", :condition => 'broken')
      subject.dock(bike)
      expect(subject.broken_bikes[0].condition).to eq 'broken'
    end
    it 'raises an error when full' do
      allow(bike).to receive(:condition).and_return('working')
      subject.capacity.times { subject.dock bike }
      expect { subject.dock double :bike }.to raise_error 'Docking station full'
    end
  end

  it 'has a default capacity of 20' do
    expect(subject.capacity).to eq 20
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      allow(bike).to receive(:condition).and_return('working')
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock bike }
      expect{ docking_station.dock bike }.to raise_error 'Docking station full'
    end
  end
  describe 'initialization' do
  subject { DockingStation.new }
  let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
      end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
  it 'unloads repaired bikes from a van' do
    bike = instance_double("bike", :condition => 'working')
    van = instance_double("van", :load => [bike])
    subject.unload_repaired_bikes(van)
    expect(subject.bikes[0]).to eq bike
  end

  it_behaves_like BikeContainer

end
