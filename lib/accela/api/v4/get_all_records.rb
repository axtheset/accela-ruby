module Accela
  module V4
    class GetAllRecords < Base

      def call(*args)
        get("records", :no_auth, *args)
      end

    end
  end
end
