require "./spec_helper"

describe CrystalWeather do
  describe CrystalWeather::API do
    describe "#new" do
      it "should create an API instance" do
        api = CrystalWeather::API.new("oe8f9re45az7d", "fr", "metric")
        api.should be_a CrystalWeather::API
        api.lang.should eq "fr"
        api.unit.should eq "metric"
      end

      it "should raise an unknown lang exception" do
        expect_raises(CrystalWeather::Exceptions::UnknownLang) do
          api = CrystalWeather::API.new("oe8f9re45az7d", "hello", "metric")
        end
      end

      it "should raise an unknown unit exception" do
        expect_raises(CrystalWeather::Exceptions::UnknownUnit) do
          api = CrystalWeather::API.new("oe8f9re45az7d", "fr", "hello")
        end
      end
    end
  end
end
