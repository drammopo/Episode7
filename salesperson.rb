Dir["./lib/*.rb"].each {|file| require file }


phil = SalesPerson.new
phil.schedule_city(Place.build("Dallas, TX"))
phil.schedule_city(Place.build("El Paso, TX"))
phil.schedule_city(Place.build("Austin, TX", true))
phil.schedule_city(Place.build("Lubbock, TX"))

puts "The original route was:"
phil.cities.each do |city|
  puts city
end
puts "\nThe new route is:"
phil.route.each do |city|
  puts city
end
puts "There are a total of #{phil.total_miles.round(2)} miles on the route."
puts "The total travel time is #{phil.total_travel_time}"