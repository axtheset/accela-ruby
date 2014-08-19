module Accela
  class API
    module Base

      def handle(response)
        responses = [
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

        rr = responses.select {|code, type, _|
          code == response.code &&
            response.parsed_response.fetch("code").to_sym
        }.first

        if response.code == 200
          response.parsed_response
        else
          error = rr ? rr.last : UnexpectedError
          message = [response.parsed_response["message"],
                     response.parsed_response["more"]].compact.map(&:to_s).join("\nAdditional information: ")
          raise error, message
        end

      end

    end
  end
end
