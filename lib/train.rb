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
    results = DB.exec("DELETE FROM trains WHERE id = #{self.id};")
  end
end
