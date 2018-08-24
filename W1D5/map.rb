class Map
  def initialize
    @map = []
  end

  def set(key, value)
    @map << [key, value]
  end

  def get(key)
    @map.each do |el|
      return el[1] if el[0] == key
    end

    nil
  end

  def delete(key)
  end

  def show
  end
end

map = Map.new
map.set(1,10)
map.set(2,20)
map.set(3,30)

p map.get(3)
