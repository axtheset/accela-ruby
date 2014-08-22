module Accela
  class Record < Model
    has_one :type

    def self.find(id)
      payload = Accela::API::V4::GetRecords.call(id)
      record_hashes = payload["result"]
      raw = RecordTranslator.json_to_ruby(record_hashes).first
      new(raw)
    end

    def self.all
      payload = Accela::API::V4::GetAllRecords.call
      record_hashes = payload["result"]
      raws = RecordTranslator.json_to_ruby(record_hashes)
      raws.map {|raw| new(raw) }
    end

    def save
    end

  end
end
