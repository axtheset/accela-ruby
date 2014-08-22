module Accela
  module V4
    class Base

      def self.call(*args)
        new.call(*args)
      end

      def get(uri, auth_type, query={})
        handle(API.connection.get("/v4/#{uri}", auth_type, query))
      end

      def post(uri, auth_type, query={}, payload={})
        handle(API.connection.post("/v4/#{uri}",
                                   auth_type,
                                   query,
                                   payload))
      end

      def put(uri, auth_type, query={}, payload={})
        handle(API.connection.put("/v4/#{uri}",
                                  auth_type,
                                  query,
                                  payload))
      end

      private

      def handle(response)
        if is_success?(response)
          response.parsed_response
        else
          ErrorHandler.handle(response)
        end
      end

      def is_success?(response)
        response.code >= 200 && response.code < 300
      end

    end
  end
end
