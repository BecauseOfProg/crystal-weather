require "./types/*"
require "./api"

# TODO: Write documentation for `CrystalWeather`
module CrystalWeather
  VERSION = "0.1.0"

  # The URL of the OpenWeatherMap API
  API_URL = "https://api.openweathermap.org/data/2.5"

  # The list of the unit systems available
  UNITS = %w(default metric imperial)

  # The list of the locales accepted by the API
  LANGS = %w(ar bg ca cz de el fa fi fr gl hr hu it ja kr la lt mk nl pl pt ro ru se sk sl es tr ua vi zh_cn zh_tw en)

  # All condition codes translated to emojis
  CONDITION_EMOJIS = {
    "01d" => '☀',
    "02d" => '⛅',
    "03d" => '☁',
    "04d" => '☁',
    "09d" => '🌧',
    "10d" => '🌦',
    "11d" => '🌩',
    "13d" => '🌨',
    "50d" => '🌫',
  }
end
