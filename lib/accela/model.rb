module Accela
  class Model
    attr_reader :raw
    @@sub_graphs = []

    def initialize(raw)
      @raw = raw
    end

    def method_missing(name, *args, &block)
      if is_property?(name)
        if has_one?(name)
          model = model_for_type(name)
          model.new(value_for_property(name))
        else
          value_for_property(name)
        end
      elsif is_assignment?(name)
        set_value_for_property(name.to_s.gsub("=", ""), args.first)
      else
        super
      end
    end

    def self.has_one(relation)
      @@sub_graphs << [:has_one, relation]
    end

    private

    def model_for_type(type)
      Object.const_get('Accela::' + type.to_s.capitalize)
    end

    def translator_for_type(type)
      Object.const_get(model_for_type(type).to_s + 'Translator')
    end

    def has_one?(name)
      @@sub_graphs.select {|type, relation|
        type == :has_one && relation == name
      }.first
    end

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
