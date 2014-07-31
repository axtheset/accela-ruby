module Accela
  class API
    module V4
      class GetAllRecords
        extend Accela::API::Base

        def self.call
          handle(API.connection.get("/v4/records", :no_auth))
        end

      end
    end
  end
end
