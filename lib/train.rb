class Train

attr_accessor :name, :id

  @@all_trains = []

  def self.all
    @@all_trains
  end

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def ==(another_train)
    self.name == another_train.name && self.id == another_train.id
  end
end
