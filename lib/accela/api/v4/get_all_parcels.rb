module Accela
  module V4
    class GetAllParcels < Base

      def call(params = {})
        get("parcels", :no_auth, params)
      end

    end
  end
end
