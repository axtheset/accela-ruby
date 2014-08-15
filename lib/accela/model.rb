module Accela
  class Model
    attr_reader :raw

    def initialize(raw)
      @raw = raw
    end

    def method_missing(name, *args, &block)
      if is_property?(name)
        value_for_property(name)
      elsif is_assignment?(name)
        set_value_for_property(name.to_s.gsub("=", ""), args.first)
      else
        super
      end
    end

    private

    def set_value_for_property(name, value)
      raw[name.to_sym] = value
    end

    def value_for_property(name)
      raw.fetch(name.to_sym)
    end

    def is_property?(name)
      raw.has_key?(name.to_sym)
    end

    def is_assignment?(name)
      name.to_s =~ /=$/
    end

  end
end
