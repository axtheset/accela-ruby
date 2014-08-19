module Accela
  class Handler
    attr_reader :response

    def self.handle(response)
      new(response).handle
    end

    def initialize(response)
      @response = response
    end

    def handle
      if response.code == 200
        response.parsed_response
      else
        exception = error ? error.last : UnexpectedError
        raise exception, message
      end
    end

    private

    def get(attribute)
      response.parsed_response[attribute.to_s]
    end

    def message
      message = [get(:message),
                 get(:more)].compact.map(&:to_s).join("\nAdditionally: ")
    end

    def error
      error_mapping.select {|code, type, _|
        code == response.code &&
          response.parsed_response.fetch("code").to_sym
      }.first
    end

    def error_mapping
      [
        [400, :bad_request, BadRequestError],
        [400, :data_validation_error, DataValidationError],
        [400, :invalid_uri, BadRequestError],
        [401, :unauthorized, AuthorizationError],
        [401, :no_token, AuthorizationError],
        [401, :token_expired, AuthorizationError],
        [401, :invalid_token, AuthorizationError],
        [401, :unauthorized_app, AuthorizationError],
        [401, :no_app_credential, AuthorizationError],
        [403, :forbidden, ForbiddenError],
        [404, :resource_not_found, NotFoundError],
        [500, :internal_server_error, ServerError],
        [500, :connection_failure, ServerError]
      ]
    end

  end
end
