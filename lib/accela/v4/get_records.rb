module Accela
  module V4
    class GetRecords < Base

      def call(*ids)
        ids_string = ids.flatten.map(&:to_s).join(",")
        get("records/#{ids_string}", :access_token)
      end

    end
  end
end
