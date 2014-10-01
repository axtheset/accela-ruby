module Accela
  module V4
    class DescribeRecordCreate < Base

      def call(*args)
        get("records/describe/create", :access_token, *args)
      end

    end
  end
end