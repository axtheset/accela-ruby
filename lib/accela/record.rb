module Accela
  class Record < Model

    def self.find(id)
      payload = Accela::API::V4::GetRecords.call(id)
      record_hashes = payload["result"]
      raw = RecordTranslator.json_to_ruby(record_hashes).first
      new(raw)
    end

    def self.all
    end

  end
end
