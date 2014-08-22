module Accela
  module V4
    class GetRecords < Base

      def self.call(*ids)
        ids_string = ids.flatten.map(&:to_s).join(",")
        handle(API.connection.get("/v4/records/#{ids_string}", :access_token))
      end

    end
  end
end
