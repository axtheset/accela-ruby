module Accela
  module V4
    class GetAllRecordTypes < Base

      def call
        get("settings/records/types", :no_auth)
      end

    end
  end
end
