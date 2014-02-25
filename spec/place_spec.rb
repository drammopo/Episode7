require_relative "../lib/place"
require_relative "../lib/map"
require 'rspec'

describe Place do

  it "should have a name" do
    subject.should respond_to(:name)
  end
  it "should have a coordinates" do
    subject.coordinates = [29,-95]
    subject.coordinates.should eq([29,-95])
  end

  it "should have a starting point property" do
    subject.should respond_to(:starting_point)
  end
  it "should not be a starting point by default" do
    subject.starting_point.should be_false
  end


  describe ":build" do
    let(:name) { "El Paso, TX"}
    let(:result) { double("el paso", coordinates: [29, -95])}

    it "should build from the map" do
      Map.should_receive(:search).with(name).and_return(result)
      Place.build(name)
    end

    it "should be place" do
      Map.stub(:search).with(name).and_return(result)
      Place.build(name).should be_a(Place)
    end

    it "should be set to the starting point when asked" do
      Map.stub(:search).with(name).and_return(result)
      place = Place.build(name, true)
      place.starting_point.should be_true
    end
  end

  describe "#to_s" do
    it "should use the city as the to_s" do
      subject.stub(:name) { "Boston" }
      subject.to_s.should eq("Boston")
    end
  end

  describe "#to_coordinates" do
    it "should delegate to_coorinates to coordinates" do
      subject.stub(:coordinates) { [5,5]}
      subject.to_coordinates.should eq ([5,5])
    end
  end
end
