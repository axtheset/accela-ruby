module Accela
  module V4
    class GetParcels < Base

      def call(id)
        get("parcels/#{id}", :no_auth)
      end

    end
  end
end
