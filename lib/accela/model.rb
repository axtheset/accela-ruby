module Accela
  class Model
    include Inflector

    attr_reader :raw
    @@sub_graphs = []

    def initialize(input={})
      @raw = translator.translation.reduce({}) {|memo, (property, _, type)|
        val = has_many?(property) ? [] : nil
        memo[property] = val
        memo
      }
      input.each {|property, value|
        unless @raw.has_key?(property)
          raise UnknownAttributeError, "unknown attribute: #{property}"
        else
          method = "#{property}="
          public_send(method, value)
        end
      }
    end

    def method_missing(name, *args, &block)
      if is_property?(name)
        if has_one?(name)
          model = model_for_name(name)
          model.new(value_for_property(name))
        elsif has_many?(name)
          model = model_for_name(singularize(name))
          items = value_for_property(name)
          items.map {|item| model.new(item) }
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

    def self.has_many(relation)
      @@sub_graphs << [:has_many, relation]
    end

    private

    def translator
      translator_for_name(demodulize(self.class)).new
    end

    def has_one?(name)
      @@sub_graphs.select {|type, relation|
        type == :has_one && relation == name
      }.first
    end

    def has_many?(name)
      @@sub_graphs.select {|type, relation|
        type == :has_many && relation == name
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
