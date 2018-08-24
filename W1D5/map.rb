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
    value = [key, get(key)]
    return nil if value[1] == nil

    @map.delete(value)
  end

  def show
    p @map
  end
end
