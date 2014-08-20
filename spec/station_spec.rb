require 'spec_helper'

describe Station do
  describe 'initialize' do
    it 'intializes with a station name and id' do
      test_station = Station.new({:name => 'Snoopy'})
      expect(test_station).to be_an_instance_of Station
    end
  end

  it 'starts out with no stations' do
    expect(Station.all).to eq []
  end

  it 'is the same station if it has the same name/id' do
    test_station1 = Station.new({:name => 'Snoopy'})
    test_station2 = Station.new({:name => 'Snoopy'})
    expect(test_station1).to eq test_station2
  end

  it 'saves train stations into the array' do
    test_station = Station.new({:name => 'Snoopy'})
    test_station.save
    expect(Station.all).to eq [test_station]
  end

  it 'removes train stations from the array' do
    test_station1 = Station.new({:name => 'Snoopy'})
    test_station2 = Station.new({:name => 'Linus'})
    test_station1.save
    test_station2.save
    test_station1.delete
    expect(Station.all).to eq [test_station2]
  end

  it 'edits the information of a train station' do
    test_station = Station.new({:name => 'Snoopy'})
    test_station.save
    test_station.edit_station('Linus')
    expect(test_station.name).to eq 'Linus'
  end

  it 'adds and finds trains that stops at a specific station' do
    test_station = Station.new({:name => 'Snoopy'})
    test_station.save
    test_train = Train.new({:name => 'green_line'})
    test_train.save
    test_station.add_line(test_train)
    expect(test_station.line_stop).to eq [test_train]
  end
end
