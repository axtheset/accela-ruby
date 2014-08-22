module Accela
  module V4
    class Base

      def self.call(*args)
        new.call(*args)
      end

      def handle(response)
        Handler.handle(response)
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

    end
  end
end
