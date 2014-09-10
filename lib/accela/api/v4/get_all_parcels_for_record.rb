module Accela
  module V4
    class GetAllParcelsForRecord < Base

      def call(id)
        get("records/#{id}/parcels", :access_token)
      end

    end
  end
end
