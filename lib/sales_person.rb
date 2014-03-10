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
      cities.insert(0, cities.delete_at(index)) if cities[index].starting_point == true   
    end
    cities
  end

  def route
    @routed_cities = CalculatesRoute.calculate(cities)
  end

  def total_miles
   CalculatesRoute.distance(routed_cities)
  end

  def total_travel_time
    t = CalculatesRoute.time(routed_cities, MILES_PER_HOUR) * 60 * 60
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
  end

end
