class SalesPerson

  MILES_PER_HOUR = 55
  attr_reader :cities, :routed_cities, :unrouted_cities
  def initialize
    @cities = []
    @unrouted_cities = []
    @routed_cities = []
  end

  def schedule_city(city)
    unrouted_cities << city unless unrouted_cities.include?(city)
    cities << city unless cities.include?(city)
    starting_city = city if city.starting_point
    cities.reject{|c| c.starting_point}
    cities.unshift(starting_city) unless (cities.include?(starting_city) || starting_city.nil?)
  end

  def route
    @routed_cities = CalculatesRoute.calculate(cities)
  end

  def total_miles
   CalculatesRoute.distance(routed_cities)
  end

  def total_travel_time
    CalculatesRoute.time(routed_cities, MILES_PER_HOUR)
  end

  def formatted_total_travel_time
    t = total_travel_time * 60 * 60
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    "%d days, %d hours, %d minutes and %d seconds" % [dd, hh, mm, ss]
  end
end
