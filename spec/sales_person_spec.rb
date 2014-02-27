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
      subject.distance_of_route.should be_within(201.1).of(1100) #=> 1141.036
    end

    it 'should output the total traveling time (assuming 55 mph)' do
      subject.travel_time.should be_within(1).of(20)
    end
  end

end
