require_relative "../lib/map"
require 'geocoder'
require 'rspec'

describe Map do

  describe ":search" do
    it "should delegate search to geocoder" do
      Geocoder.should_receive(:search).with("austin, tx")
      Map.search("austin, tx")
    end

    it "should use the first item in the array" do
      austin = double("Austin")
      dallas = double("Dallas")
      Geocoder.stub(:search) {[austin, dallas]}
      Map.search("austin, tx").should eq(austin)
    end
  end

  describe ":distance" do
    it "should calculate distance between two sets of coordinates" do
      alpha = double
      beta = double
      Geocoder::Calculations.should_receive(:distance_between).with(alpha, beta)
      Map.distance_between(alpha, beta)
    end
  end
end
