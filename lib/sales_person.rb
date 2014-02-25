class SalesPerson

  attr_reader :cities
  def initialize
    @cities = []
  end

  def schedule_city(city)
    @cities << city unless @cities.include?(city)
    @cities.each_with_index do |city, index|
      if city.starting_point == true
      @cities.insert(0, cities.delete_at(index))
      end
    end
  end

  def route
    CalculatesRoute.calculate(cities)
  end

end
