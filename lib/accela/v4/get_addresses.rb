module Accela
  module V4
    class GetAddresses < Base

      def call(id)
        get("addresses/#{id}", :no_auth)
      end

    end
  end
end
