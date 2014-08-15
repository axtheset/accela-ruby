module Accela
  class Translator

    def json_to_ruby(hashes=[])
      hashes.map &json_to_ruby_lambda
    end

    private

    def json_to_ruby_lambda
      ->(hash) {
        translation.inject({}) {|memo, tuple|
          ruby, json, type = tuple
          if hash.has_key?(json.to_s)
            memo.merge({ ruby => hash[json.to_s] })
          else
            memo
          end
        }
      }
    end

    def type_map
      {
        integer: identity,
        long: identity,
        string: identity,
        boolean: identity,
        double: identity,
        date: to_date,
        dateTime: to_date
      }
    end

    def identity
      ->(i) { i }
    end

    def to_date
      ->(i) { Date.parse(i) }
    end

    def from_date
      ->(i) { i.strftime("%F") }
    end

  end
end
