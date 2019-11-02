require "./spec_helper"

describe CrystalWeather do
  describe CrystalWeather::API do
    describe "#new" do
      it "should create an API instance" do
        api = CrystalWeather::API.new(ENV["WEATHER_API_KEY"], "fr", "metric")
        api.should be_a CrystalWeather::API
        api.lang.should eq "fr"
        api.unit.should eq "metric"
      end

      it "should raise an unknown lang exception" do
        expect_raises(CrystalWeather::Exceptions::UnknownLang) do
          api = CrystalWeather::API.new(ENV["WEATHER_API_KEY"], "hello", "metric")
        end
      end

      it "should raise an unknown unit exception" do
        expect_raises(CrystalWeather::Exceptions::UnknownUnit) do
          api = CrystalWeather::API.new(ENV["WEATHER_API_KEY"], "fr", "hello")
        end
      end
    end

    describe "#current" do
      it "should print the raw weather data" do
        api = CrystalWeather::API.new(ENV["WEATHER_API_KEY"], "fr", "metric")
        api.current("Lyon,FR")
      end

      it "should raise an unknown location error" do
        expect_raises(CrystalWeather::Exceptions::NotFound) do
          api = CrystalWeather::API.new(ENV["WEATHER_API_KEY"], "fr", "metric")
          api.current("Washington,FR")
        end
      end

      it "should raise an unauthorized key error" do
        expect_raises(CrystalWeather::Exceptions::Unauthorized) do
          api = CrystalWeather::API.new("sample key", "fr", "metric")
          api.current("Lyon,FR")
        end
      end
    end

    describe "#forecast" do
      it "should print the raw forecast data" do
        api = CrystalWeather::API.new(ENV["WEATHER_API_KEY"], "fr", "metric")
        api.forecast("Lyon,FR")
      end
    end
  end
end
