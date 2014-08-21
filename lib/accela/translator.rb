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
            type_transform = type_map.fetch(type).first
            memo.merge({ ruby => type_transform.call(hash[json.to_s]) })
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
            type_transform = type_map.fetch(type).last
            memo.merge({ json.to_s => type_transform.call(hash[ruby.to_sym]) })
          elsif key == unknown_attribute_key
            memo.merge(stringify_keys(val))
          else
            memo
          end
        }
      }
    end

    def stringify_keys(hash)
      hash.inject({}) {|memo, (key, val)|
        memo.merge({key.to_s => val})
      }
    end

    def type_map
      {
        integer: [identity, identity],
        long: [identity, identity],
        string: [identity, identity],
        boolean: [identity, identity],
        double: [identity, identity],
        date: [to_date, from_date],
        dateTime: [to_date_time, from_date_time],
        Type: translator(:type)
      }
    end

    def translator_map
      {
        type: TypeTranslator
      }
    end

    def translator(type)
      translator = translator_map[type]
      [ ->(i) { translator.json_to_ruby([i]).first },
        ->(i) { translator.ruby_to_json([i]).first } ]
    end

    def identity
      ->(i) { i }
    end

    def to_date_time
      ->(i) { DateTime.parse(i) }
    end

    def to_date
      ->(i) { Date.parse(i) }
    end

    def from_date
      ->(i) { i.strftime("%F") }
    end

    def from_date_time
      ->(i) { i.strftime("%F %T") }
    end

    def unknown_attribute_key
      :__other__
    end

  end
end
