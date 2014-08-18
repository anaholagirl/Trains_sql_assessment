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
end
