require 'pry'
class Train

attr_accessor :name, :id

  def self.all
    results = DB.exec("SELECT * FROM trains;")
    trains = []
    results.each do |train|
      name = train['name']
      id = train['id'].to_i
      trains << Train.new({:name => name, :id => id})
    end
    trains
  end

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def ==(another_train)
    self.name == another_train.name && self.id == another_train.id
  end

  def save
    results = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM trains WHERE id = #{self.id};")
  end

  def edit_train(input_name)
    @name = input_name
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{self.id};")
  end

  def stops
    station_stops = []
    results = DB.exec("SELECT stations.* FROM trains JOIN stops ON (trains.id = stops.trains_id) JOIN stations ON (stops.stations_id = stations.id) WHERE trains.id = #{self.id};")
    results.each do |station|
      station_found = station['name']
      stations_id = station['id'].to_i
      station_stops << Station.new({:name => station_found, :id => stations_id})
    end
    station_stops
  end

  def add_stop(input_station)
    DB.exec("INSERT INTO stops (stations_id, trains_id) VALUES (#{input_station.id}, #{self.id}) RETURNING id;")
  end

  def self.find(input_train)
    Train.all.each do |train|
      if train.name == input_train
        return train
      end
    end
  end
end
