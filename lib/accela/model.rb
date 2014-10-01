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
      @types = Hash[translator.translation.map {|property, _, type| [property, type] }]
      update(input)
    end

    def self.create(input={})
      model = new(input)
      model
    end

    def update(input)
      input.each {|property, value|
        unless is_property?(property)
          raise UnknownAttributeError, "unknown attribute: #{property}"
        else
          set_value_for_property(property, value)
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
      else
        super
      end
    end

    def self.has_one(*relations)
      Array(relations).each do |relation|
        @@sub_graphs << [:has_one, relation]
      end
    end

    def self.has_many(*relations)
      Array(relations).each do |relation|
        @@sub_graphs << [:has_many, relation]
      end
    end

    def inspect
      properties = raw.reject {|prop, _|
        has_one?(prop) || has_many?(prop)
      }.map {|key, val|
        [key, val.inspect]
      }.map {|pair|
        pair.join(": ")
      }.join(", ")
      "#<#{self.class} #{properties}>"
    end

    private

    def validate_type(property, value)
      number = ->(i) { i.is_a? Fixnum }

      primatives = [:integer, :long, :string, :boolean, :double, :date, :dateTime]

      type = @types[property.to_sym]

      primative = primatives.include?(type)
      has_many = type.is_a?(Array) && value.is_a?(Array) && value.inject(true) {|m, v|
        m && v.is_a?(model_for_name(type.first))
      }
      has_one = !primative && !has_many && value.is_a?(model_for_name(type))

      if primative || has_many || has_one
        true
      else
        raise TypeMismatchError, "Incorrect type: #{value.inspect} is not of type #{type}"
      end
    end

    def translator
      translator_for_name(demodulize(self.class)).new
    end

    def has_one?(name)
      @@sub_graphs.select {|type, relation|
        type == :has_one && relation == name.to_sym
      }.first
    end

    def has_many?(name)
      @@sub_graphs.select {|type, relation|
        type == :has_many && relation == name.to_sym
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
