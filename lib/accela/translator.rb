module Accela
  class Translator

    def self.json_to_ruby(hashes=[])
      new.json_to_ruby(hashes)
    end

    def json_to_ruby(hashes=[])
      hashes.map &json_to_ruby_lambda
    end

    def self.ruby_to_json(hashes=[])
      new.ruby_to_json(hashes)
    end

    def ruby_to_json(hashes=[])
      hashes.map &ruby_to_json_lambda
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

    def ruby_to_json_lambda
      ->(hash) {
        translation.inject({}) {|memo, tuple|
          ruby, json, type = tuple
          if hash.has_key?(ruby.to_sym)
            memo.merge({ json.to_s => hash[ruby.to_sym] })
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
