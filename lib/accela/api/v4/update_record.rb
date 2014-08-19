module Accela
  class API
    module V4
      class UpdateRecord
        extend Accela::API::Base

        def self.call(id, payload)
          handle(API.connection.put("/v4/records/#{id}", :access_token, {}, payload))
        end

      end
    end
  end
end
