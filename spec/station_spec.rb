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
end
