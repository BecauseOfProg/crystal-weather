module CrystalWeather
  # Exception is the base exception for the `CrystalWeather` library
  class Exception < ::Exception
  end

  # Module Exceptions contains all the exceptions that the library can raise if an error occurs
  module Exceptions
    # UnknownLang informs that the caller used a lang that isn't recognized
    class UnknownLang < CrystalWeather::Exception
    end

    # UnknownUnit informs that the caller used a unit system that isn't recognized
    class UnknownUnit < CrystalWeather::Exception
    end

    # Unauthorized informs that caller's key is wrong, so it cannot access to the API
    class Unauthorized < CrystalWeather::Exception
    end

    # DataError informs that there's an error in the data sended to the API
    class DataError < CrystalWeather::Exception
    end
  end
end
