module Accela
  class API
    module V4
      class GetAllRecordTypes
        extend Accela::API::Base

        def self.call
          handle(API.connection.get("/v4/settings/records/types", :no_auth))
        end

      end
    end
  end
end
