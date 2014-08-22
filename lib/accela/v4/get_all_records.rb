module Accela
  module V4
    class GetAllRecords < Base

      def self.call
        handle(API.connection.get("/v4/records", :no_auth))
      end

    end
  end
end
