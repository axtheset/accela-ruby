module Accela
  module V4
    class CreateRecord < Base

      def self.call(payload)
        handle(API.connection.post("/v4/records",
                                   :access_token,
                                   {},
                                   payload))
      end

    end
  end
end
