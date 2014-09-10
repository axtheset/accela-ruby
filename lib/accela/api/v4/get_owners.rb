module Accela
  module V4
    class GetOwners < Base

      def call(id)
        get("owners/#{id}", :access_token)
      end

    end
  end
end
