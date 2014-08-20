require 'spec_helper'
require 'pry'

describe 'Train' do
  describe 'initialize' do
    it 'initializes with a train line name and id' do
      test_train = Train.new({:name => 'green_line'})
      expect(test_train).to be_an_instance_of Train
    end
  end

  it 'starts out with no trains' do
    expect(Train.all).to eq []
  end

  it 'is the same train if it has the same train name/id' do
    test_train1 = Train.new({:name => 'green_line'})
    test_train2 = Train.new({:name => 'green_line'})
    expect(test_train1).to eq test_train2
  end

  it 'saves train lines into the array' do
    test_train = Train.new({:name => 'green_line'})
    test_train.save
    expect(Train.all).to eq [test_train]
  end

  it 'removes train lines from the array' do
    test_train1 = Train.new({:name => 'green_line'})
    test_train2 = Train.new({:name => 'blue_line'})
    test_train1.save
    test_train2.save
    test_train1.delete
    expect(Train.all).to eq [test_train2]
  end

  it 'edits a train in the system' do
    test_train = Train.new({:name => 'green_line'})
    test_train.save
    test_train.edit_train('yellow_line')
    expect(test_train.name).to eq 'yellow_line'
  end

  it 'starts with an empty array of stops' do
    test_train = Train.new({:name => 'green_line'})
    test_train.save
    expect(test_train.stops).to eq []
  end

  it 'adds and finds stops to a train line' do
    test_train = Train.new({:name => 'green_line'})
    test_train.save
    test_station = Station.new({:name => 'Snoopy'})
    test_station.save
    test_train.add_stop(test_station)
    expect(test_train.stops).to eq [test_station]
  end

  it 'finds a specific train' do
    test_train = Train.new({:name => 'green_line'})
    test_train.save
    expect(Train.find('green_line')).to eq [test_train]
  end
end
