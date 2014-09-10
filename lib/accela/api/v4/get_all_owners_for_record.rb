module Accela
  module V4
    class GetAllOwnersForRecord < Base

      def call(id)
        get("records/#{id}/owners", :access_token)
      end

    end
  end
end
