module Accela
  module V4
    class GetAllAddressesForRecord < Base

      def call(id)
        get("records/#{id}/addresses", :access_token)
      end

    end
  end
end
