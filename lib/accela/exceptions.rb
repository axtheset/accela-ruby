module Accela
  class AccelaError < ::StandardError; end

  # HTTP API Errors
  class InvalidTokenError < AccelaError; end
  class AuthorizationError < AccelaError; end
  class ForbiddenError < AccelaError; end
  class NotFoundError < AccelaError; end
  class ServerError < AccelaError; end
  class BadRequestError < AccelaError; end
  class DataValidationError < AccelaError; end
  class UnsupportedAuthTypeError < AccelaError; end
  class UnexpectedError < AccelaError; end

  class ConfigurationError < AccelaError
    def initialize(setting, message)
      super "Accela::Configuration.#{setting} #{message}"
    end
  end
end
