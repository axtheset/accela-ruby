module Accela
  module V4
    class GetAllRecords < Base

      def call
        get("records", :no_auth)
      end

    end
  end
end
