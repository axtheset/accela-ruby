module Accela
  class Repository

    private

    def update_from_hash(object, hash)
      hash.each do |prop, val|
        type = prop_map[prop.to_sym]
        transform = type_map[type]
        method = (to_snake_case(prop) + '=').to_sym
        if object.respond_to?(method)
          object.public_send(method, transform.call(val))
        end
      end
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

    def to_snake_case(str)
      str.to_s.gsub(/([A-Z])/, '_\1').downcase
    end

  end
end
