module Accela
  class API
    module V4
      class GetRecords
        extend Accela::API::Base

        def self.call(*ids)
          ids_string = ids.map(&:to_s).join(",")
          handle(API.connection.get("/v4/records/#{ids_string}", :access_token))
        end

      end
    end
  end
end
