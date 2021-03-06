class CalculatesRoute

  def self.calculate(points)
    remaining_points = points.clone
    route = []
    route << remaining_points.slice!(0)
    until remaining_points == [] do
      next_point = shortest_distance(route.last, remaining_points)
      route << remaining_points.slice!(remaining_points.index(next_point))
    end
    route
  end

  def self.shortest_distance(from, possible)
    distances = possible.map do |point|
      {point: point, distance: Map.distance_between(from, point)}
    end
    distances.sort{|a,b| a.fetch(:distance) <=> b.fetch(:distance)}.first.fetch(:point)
  end

  def self.distance(route)
    total_distance = 0.0
    route.each_cons(2) do |route_combo|
      total_distance += Map.distance_between(route.first,route.last)
    end
    return total_distance
  end

  def self.time(route,speed)
    (distance(route) / speed).to_f
  end
end

