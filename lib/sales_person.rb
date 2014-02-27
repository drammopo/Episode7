class SalesPerson

  MILES_PER_HOUR = 55
  attr_reader :cities, :routed_cities
  def initialize
    @cities = []
    @routed_cities = []
  end

  def schedule_city(city)
    cities << city unless cities.include?(city)
    cities.each_index do |index|
      if cities[index].starting_point == true
        cities.insert(0, cities.delete_at(index))
      end
    end
    cities
  end

  def route
    @routed_cities = CalculatesRoute.calculate(cities)
  end

  def distance_of_route
   CalculatesRoute.distance(routed_cities)
  end

  def travel_time
    CalculatesRoute.time(routed_cities, MILES_PER_HOUR)
  end

end
