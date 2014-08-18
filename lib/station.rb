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
end
