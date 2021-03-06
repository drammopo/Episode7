require 'benchmark'

Dir["./lib/*.rb"].each {|file| require file }

def run_route(n)
  salesperson = SalesPerson.new

  all_cities = ["Abilene", "Alamo", "Alamo Heights", "Alice", "Allen", "Alpine", "Alvarado", "Alvin", "Amarillo", "Andrews", "Angleton", "Argyle", "Arlington", "Austin", "Azle", "Balch Springs", "Bastrop", "Bay City", "Baytown", "Beaumont", "Bellaire", "Belton", "Benbrook", "Big Spring", "Boerne", "Brenham", "Bridgeport", "Brownfield", "Brownsville", "Brownwood", "Bryan", "Bulverde", "Burkburnett", "Burleson", "Burnet", "Canyon", "Carrollton", "Carthage", "Cedar Hill", "Cedar Park", "Cleburne", "Clute", "College Station", "Colleyville", "Columbus", "Conroe", "Converse", "Coppell", "Copperas Cove", "Corinth", "Corpus Christi", "Corsicana", "Crockett", "Crowley", "Dallas", "Deer Park", "Del Rio", "Denison", "Denton", "Desoto", "Devine", "Dickinson", "Donna", "Dumas", "Duncanville", "Eagle Pass", "Edinburg", "El Campo", "El Paso", "Ennis", "Euless", "Farmers Branch", "Flower Mound", "Fort Stockton", "Fort Worth", "Fredericksburg", "Freeport", "Friendswood", "Frisco", "Gainesville", "Galveston", "Garden Ridge", "Garland", "Gatesville", "Georgetown", "Gonzales", "Granbury", "Grand Prairie", "Granite Shoals", "Grapevine", "Greenville", "Haltom City", "Hamilton", "Harker Heights", "Harlingen", "Hearne", "Henderson", "Hewitt", "Highland Park", "Highland Village", "Houston", "Humble", "Hunters Creek Village", "Huntsville", "Hurst", "Irving", "Jacksonville", "Jasper", "Jersey Village", "Katy", "Keller", "Kemah", "Kennedale", "Kerrville", "Killeen", "Kingsville", "Krum", "Kyle", "La Grange", "La Porte", "Lacy Lakeview", "Lago Vista", "Lake Jackson", "Lakeway", "Lamesa", "Lampasas", "Lancaster", "Laredo", "League City", "Leander", "Leon Valley", "Levelland", "Lewisville", "Littlefield", "Live Oak", "Lockhart", "Longview", "Lowry Crossing", "Lubbock", "Lucas", "Lufkin", "Mansfield", "Manvel", "Marble Falls", "Marshall", "McAllen", "McKinney", "Mesquite", "Midland", "Midlothian", "Mission", "Missouri City", "Mount Pleasant", "Muleshoe", "Murphy", "Nacogdoches", "Nassau Bay", "New Braunfels", "Newark", "Newton", "North Richland Hills", "Oak Ridge North", "Odessa", "Orange", "Overton", "Palacios", "Palestine", "Pampa", "Paris", "Pasadena", "Pearland", "Perryton", "Pflugerville", "Plainview", "Plano", "Port Aransas", "Port Arthur", "Port Lavaca", "Portland", "Richardson", "Richland Hills", "Ridge City", "Rio Grande City", "River Oaks", "Rockport", "Rockwall", "Rosenberg", "Round Rock", "Rowlett", "Royse City", "Rusk", "Sachse", "Saginaw", "San Angelo", "San Antonio", "San Benito", "San Marcos", "San Saba", "Santa Fe", "Schertz", "Seabrook", "Sealy", "Seguin", "Selma", "Seymour", "Shenandoah", "Sherman", "Smithville", "Snyder", "Socorro", "Sonora", "Southlake", "Southside Place", "Spring Valley", "Stafford", "Stephenville", "Sugar Land", "Sulphur Springs", "Sweeny", "Tahoka", "Taylor", "Temple", "Terrell", "Texarkana", "Texas City", "The Colony", "The Woodlands", "Tomball", "Tyler", "Universal City", "University Park", "Victoria", "Waco", "Watauga", "Waxahachie", "Weatherford", "Webster", "Weslaco", "West Columbia", "West Lake Hills", "West Orange", "West University Place", "Weston", "Wharton", "White Settlement", "Wichita Falls", "Willow Park", "Windcrest", "Woodway", "Wylie", "Yoakum"]

  all_cities.shuffle.take(n).each do |city|
      salesperson.schedule_city(Place.build("#{city}, TX"))
  end
end


Benchmark.bm do |x|
  x.report("Benchmarking 2 city route:"){ run_route(2) }
  x.report("Benchmarking 10 city route:"){ run_route(10) }
  x.report("Benchmarking 50 city route:"){ run_route(50) }
  x.report("Benchmarking 200 city route:"){ run_route(100) }
end
