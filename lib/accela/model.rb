module Accela
  class Model
    attr_reader :raw

    def initialize(raw)
      @raw = raw
    end

    def method_missing(name)
      property = name.to_sym
      if raw.has_key?(property)
        raw.fetch(property)
      else
        super
      end
    end

  end
end
