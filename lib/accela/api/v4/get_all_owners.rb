module Accela
  module V4
    class GetAllOwners < Base

      def call(params = {})
        get("owners", :access_token, params)
      end

    end
  end
end
