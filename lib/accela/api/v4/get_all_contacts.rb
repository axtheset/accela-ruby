module Accela
  module V4
    class GetAllContacts < Base

      def call
        get("contacts", :access_token)
      end

    end
  end
end
