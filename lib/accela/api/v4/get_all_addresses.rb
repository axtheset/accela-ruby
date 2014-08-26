module Accela
  module V4
    class GetAllAddresses < Base

      def call(params = {})
        get("addresses", :no_auth, params)
      end

    end
  end
end
