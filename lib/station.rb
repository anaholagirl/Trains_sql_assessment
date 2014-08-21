class Station

  attr_accessor :name, :id

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM stations;")
    results.each do |station|
      name = station['name']
      id = station['id'].to_i
      stations << Station.new({:name => name, :id => id})
    end
    stations
  end

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def ==(another_station)
    self.name == another_station.name && self.id == another_station.id
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    results = DB.exec("DELETE FROM stations WHERE id = #{self.id};")
  end

  def edit_station(input_name)
    @name = input_name
    DB.exec("UPDATE stations SET name = '#{@name}' WHERE id = '#{self.id}';")
  end

  def add_line(input_train)
    DB.exec("INSERT INTO stops (stations_id, trains_id) VALUES ('#{self.id}', '#{input_train.id}') RETURNING id;")
  end

  def line_stop
    line_stops = []
    results = DB.exec("SELECT trains.* FROM stations JOIN stops ON (stations.id = stops.stations_id) JOIN trains ON (stops.trains_id = trains.id) WHERE stations.id = #{self.id};")
    results.each do |train|
        train_found = train['name']
        trains_id = train['id'].to_i
        line_stops << Train.new({:name => train_found, :id => trains_id})
    end
    line_stops
  end

  def self.find(input_station)
    Station.all.each do |station|
      if station.name == input_station
        return station
      end
    end
  end
end
