module Accela
  class API
    module Base

      def handle(response)
        if response.code == 200
          response.parsed_response
        elsif response.code == 401
          raise AuthorizationError
        else
          raise UnexpectedError, "Unexpected HTTP response code: #{response.code}"
        end
      end

    end
  end
end
