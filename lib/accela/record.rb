module Accela
  class Record
    attr_reader :raw

    def self.find(id)
      payload = Accela::API::V4::GetRecords.call(id)
      record_hashes = payload["result"]
      raw = RecordTranslator.new.json_to_ruby(record_hashes).first
      new(raw)
    end

    def self.all
    end

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
