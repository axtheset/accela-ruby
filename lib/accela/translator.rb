module Accela
  class Translator
    include Inflector

    def self.json_to_ruby(hashes=[])
      new.json_to_ruby(hashes)
    end

    def json_to_ruby(hashes=[])
      hashes.to_a.map &json_to_ruby_lambda
    end

    def self.ruby_to_json(hashes=[])
      new.ruby_to_json(hashes)
    end

    def ruby_to_json(hashes=[])
      hashes.to_a.map &ruby_to_json_lambda
    end

    private

    def json_to_ruby_lambda
      ->(hash) {
        hash.inject({}) {|memo, (key, val)|
          tuple = translation.select {|ruby, json, type| json == key.to_sym }.first
          if tuple
            ruby, json, type = tuple
            type_transform = transform_to_ruby(type)
            memo.merge({ ruby => type_transform.call(hash[json.to_s]) })
          else
            memo
          end
        }
      }
    end

    def ruby_to_json_lambda
      # Right now there is a bit of asymmetry between json_to_ruby and ruby_to_json:
      # the former will not include keys with nil or empty values, while the former
      # includes everything.
      ->(hash) {
        hash.inject({}) {|memo, (key, val)|
          tuple = translation.select {|ruby, json, type| ruby == key.to_sym }.first
          if tuple
            ruby, json, type = tuple
            type_transform = transform_to_json(type)
            value = type_transform.call(hash[ruby.to_sym])
            if value != nil
              memo.merge({ json.to_s => value })
            else
              memo
            end
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

    def transform_to_json(type)
      transform(type).last
    end

    def transform_to_ruby(type)
      transform(type).first
    end

    def transform(type)
      if is_collection_type?(type)
        inner_type = extract_type_from_collection_type(type)
        t = scalar_transform(inner_type)
        [ ->(is) { is.map(&t.first) },
          ->(is) { is.map(&t.last) } ]
      else
        scalar_transform(type)
      end
    end

    def scalar_transform(type)
      if primitive_type_map.has_key?(type)
        primitive_type_map.fetch(type)
      else
        translator = translator_for_name(underscore(type))
        [ ->(i) { translator.json_to_ruby([i].compact).first },
          ->(i) { translator.ruby_to_json([i].compact).first } ]
      end
    end

    def is_collection_type?(type)
      type.kind_of?(Array)
    end

    def extract_type_from_collection_type(type)
      type.first
    end

    def primitive_type_map
      {
        integer: [identity, identity],
        long: [identity, identity],
        string: [identity, identity],
        boolean: [identity, identity],
        double: [identity, identity],
        date: [to_date, from_date],
        dateTime: [to_date_time, from_date_time],
      }
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
      ->(i) { i && i.strftime("%F") }
    end

    def from_date_time
      ->(i) { i && i.strftime("%F %T") }
    end

  end
end
