require "http"

module CrystalWeather
  # API is the interface that allows caller to interact with OpenWeatherMap's API
  class API
    getter units : String
    getter lang : String

    # Creates a new API object
    def initialize(api_key : String, lang : String, units : String)
      @api_key = api_key

      raise Exceptions::UnknownLang.new("the lang #{lang} can't be accepted (please refer to the list of accepted langs on the documentation)") unless LANGS.includes? lang
      @lang = lang

      raise Exceptions::UnknownUnit.new("the units #{units} can't be accepted (please refer to the list of accepted units on the documentation)") unless UNITS.includes? unit
      @units = units
    end

    # Fetches the current weather for a specific location
    def current(location : String) : Types::Current
      data = raw_current(location)
      return Types::Current.new
    end

    # Fetches the forecast for a specific location
    def forecast(location : String) : Types::Forecast
      data = raw_forecast(location)
      return Types::Forecast.new
    end

    # Gets the raw data of the current weather for a specific location
    def raw_current(location : String) : JSON::Any
      return make_request("weather", location)
    end

    # Gets the raw data of the forecast for a specific location
    def raw_forecast(location : String) : JSON::Any
      return make_request("weather", location)
    end

    private def make_request(type : String, location : String) : JSON::Any
      params = HTTP::Params.new
      params.add("APPID", @api_key)
      params.add("q", location)
      params.add("lang", @lang)
      params.add("units", @units)

      url = URI.parse("#{API_URL}/#{type}?#{params}")
      response = HTTP::Client.get(url)
      data = JSON.parse(response.body)

      if response.success?
        return data
      else
        api_status_text = "(API status : #{data["message"]})"
        case response.status_code
        when 404
          raise Exceptions::NotFound.new("location #{location} wasn't found #{api_status_text}")
        when 401
          raise Exceptions::Unauthorized.new("the provided API key isn't valid #{api_status_text}")
        else
          raise Exceptions::UnknownAPIError.new("API returned an unknown error #{api_status_text}")
        end
      end
    end
  end
end
