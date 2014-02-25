require_relative "./map"

class Place
  attr_accessor :name, :coordinates, :starting_point

  def self.build(name, starting_point = false)
    results = Map.search(name)
    Place.new.tap do |p|
      p.name = name
      p.coordinates = results.coordinates
      p.starting_point ||= starting_point
    end
  end

  def to_s
    name
  end

  def to_coordinates
    coordinates
  end
end
