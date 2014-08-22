module Accela
  module V4
    class UpdateRecord < Base

      def call(id, payload)
        put("records/#{id}", :access_token, {}, payload)
      end

    end
  end
end
