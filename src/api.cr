module CrystalWeather
  # API is the interface that allows caller to interact with OpenWeatherMap's API
  class API
    getter unit : String
    getter lang : String

    # Creates a new API object
    def initialize(api_key : String, lang : String, unit : String)
      @api_key = api_key

      raise Exceptions::UnknownLang.new("unknown lang #{lang}") unless LANGS.includes? lang
      @lang = lang

      raise Exceptions::UnknownUnit.new("unknown unit #{unit}") unless UNITS.includes? unit
      @unit = unit
    end

    # Fetches the current weather for a specific location
    def current(location : String) : Current
    end

    # Fetches the forecast for a specific location
    def forecast(location : String) : Forecast
    end
  end
end
