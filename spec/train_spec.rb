require 'spec_helper'

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
end
