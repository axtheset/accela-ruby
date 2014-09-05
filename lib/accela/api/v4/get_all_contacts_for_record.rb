module Accela
  module V4
    class GetAllContactsForRecord < Base

      def call(id)
        get("records/#{id}/contacts", :access_token)
      end

    end
  end
end
