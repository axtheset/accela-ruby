module Accela
  module V4
    class GetRecords < Base

      def call(*i, q)
        given_hash = q.class == Hash
        query = given_hash ? q : {}
        ids = given_hash ? i : i + [q]
        query = compact_query(query)

        ids_string = ids.flatten.map(&:to_s).join(",")
        get("records/#{ids_string}", :access_token, query)
      end

      private

      def compact_query(query)
        Hash[
          query.map {|key, val|
            [key.to_s, transform(key).call(val)]
          }
        ]
      end

      def transform(name)
        map = {
          expand: ->(i) { i.join(",") }
        }
        if map.has_key?(name)
          map.fetch(name)
        else
          ->(i) { i }
        end
      end

    end
  end
end
