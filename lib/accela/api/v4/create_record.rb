module Accela
  class API
    module V4
      class CreateRecord
        extend Accela::API::Base

        def self.call(payload)
          handle(API.connection.post("/v4/records",
                                     :access_token,
                                     {},
                                     payload))
        end

      end
    end
  end
end