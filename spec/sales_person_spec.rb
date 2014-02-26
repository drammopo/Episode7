require 'rspec'
require_relative "../lib/sales_person"
require_relative "../lib/calculates_route"
require_relative "../lib/place"

describe SalesPerson do
  xit "should have many cities" do
    city = stub
    subject.schedule_city(city)
    subject.cities.should include(city)
  end

  xit "should keep the cities only scheduled once" do
    city = stub
    expect{
      subject.schedule_city(city)
      subject.schedule_city(city)
    }.to change(subject.cities,:count).by(1)
  end

  it "should calculate a route via the CalculatesRoute" do
    cities = [stub, stub, stub]
    subject.stub(:cities) { cities }
    CalculatesRoute.should_receive(:calculate).with(cities)
    subject.route
  end

  it "should returns the route from CalculatesRoute" do
    route_stub = [stub, stub]
    CalculatesRoute.stub(:calculate) { route_stub }
    subject.route.should eq(route_stub)
  end

  it 'should be able to choose his/her starting point' do
    city = Place.build("Dallas, TX")
    another_city = Place.build("El Paso, TX", true)
    subject.schedule_city(city)
    subject.schedule_city(another_city)
    subject.cities.should == [another_city, city]
  end

  it 'should log the total miles' do
    city = Place.build("Dallas, TX")
    another_city = Place.build("El Paso, TX", true)
    subject.schedule_city(city)
    subject.schedule_city(another_city)
    subject.schedule_city(Place.build("Austin, TX"))
    #subject.route_distance.should be_within(0.01).of(570.5181717964364)
    puts subject.distance_of_route
  end

end
