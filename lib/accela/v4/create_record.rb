module Accela
  module V4
    class CreateRecord < Base

      def call(payload)
        post("records", :access_token, {}, payload)
      end

    end
  end
end
