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
        hash.inject({}) {|memo, (key, val)|
          tuple = translation.select {|ruby, json, type| json == key.to_sym }.first
          if tuple
            ruby, json, type = tuple
            memo.merge({ ruby => hash[json.to_s] })
          elsif memo.has_key?(unknown_attribute_key)
            memo.merge({ unknown_attribute_key => memo.fetch(unknown_attribute_key).merge({ key.to_sym => val })})
          else
            memo.merge({ unknown_attribute_key => { key.to_sym => val }})
          end
        }
      }
    end

    def ruby_to_json_lambda
      ->(hash) {
        hash.inject({}) {|memo, (key, val)|
          tuple = translation.select {|ruby, json, type| ruby == key.to_sym }.first
          if tuple
            ruby, json, type = tuple
            memo.merge({ json.to_s => hash[ruby.to_sym] })
          elsif key == unknown_attribute_key
            stringified = val.inject({}) {|memo, (key, val)| memo.merge({key.to_s => val}) }
            memo.merge(stringified)
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

    def unknown_attribute_key
      :__other__
    end

  end
end
