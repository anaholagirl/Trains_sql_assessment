require 'spec_helper'

describe 'Train' do
  describe 'initialize' do
    it 'initializes with a train line name and id' do
      test_train = Train.new({:name => 'green line'})
      expect(test_train).to be_an_instance_of Train
    end
  end
end
