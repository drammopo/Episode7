require_relative "../lib/sales_person"
require_relative "../lib/calculates_route"
require_relative "../lib/place"
require 'rspec'

describe SalesPerson do

  it "should have many cities" do
    city = double(:city, starting_point: false)
    subject.schedule_city(city)
    subject.cities.should include(city)
  end

  it "should keep the cities only scheduled once" do
    city = double(:city, starting_point: false)
    expect{
      subject.schedule_city(city)
      subject.schedule_city(city)
    }.to change(subject.cities,:count).by(1)
  end

  it "should calculate a route via the CalculatesRoute" do
    cities = [double, double, double]
    subject.stub(:cities) { cities }
    CalculatesRoute.should_receive(:calculate).with(cities)
    subject.route
  end

  it "should returns the route from CalculatesRoute" do
    route_stub = [double, double]
    CalculatesRoute.stub(:calculate) { route_stub }
    subject.route.should eq(route_stub)
  end

context "working with live datasets" do

     let (:city){Place.build("Dallas, TX")}
     let (:another_city){Place.build("El Paso, TX", true)}
     let (:yet_another_city){Place.build("El Paso, TX")}

     before :each do
       subject.schedule_city(city)
       subject.schedule_city(another_city)
       subject.schedule_city(yet_another_city)
       subject.route
     end

    it 'should be able to choose his/her starting point' do
      subject.cities.should == [another_city, city, yet_another_city]
    end

    it 'should log the total miles for the route' do
      subject.total_miles.should be_within(201.1).of(1100)
    end

    it 'should output the total traveling time (assuming 55 mph)' do
      subject.total_travel_time.should be_within(1).of(20)
    end
  end

end
