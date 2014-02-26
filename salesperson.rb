Dir["./lib/*.rb"].each {|file| require file }


phil = SalesPerson.new
phil.schedule_city(Place.build("Dallas, TX"))
phil.schedule_city(Place.build("El Paso, TX"))
phil.schedule_city(Place.build("Austin, TX", true))
phil.schedule_city(Place.build("Lubbock, TX"))

#puts phil.cities.inspect => [#<Place:0x007fd3e2bbf838 @name="Austin, TX", @coordinates=[30.267153, -97.7430608], @starting_point=true>, #<Place:0x007fd3e2bcee78 @name="Dallas, TX", @coordinates=[32.7801399, -96.80045109999999], @starting_point=false>, #<Place:0x007fd3e2bc7880 @name="El Paso, TX", @coordinates=[31.7699559, -106.4968055], @starting_point=false>, #<Place:0x007fd3e2bb66e8 @name="Lubbock, TX", @coordinates=[33.5778631, -101.8551665], @starting_point=false>]
puts phil.route
puts phil.distance_of_route
#puts phil.cities.inspect => []
