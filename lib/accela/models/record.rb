module Accela
  class Record < Model
    has_one :type
    has_many :addresses

    def self.find(id)
      payload = Accela::V4::GetRecords.call(id)
      record_hashes = payload["result"]
      raw = RecordTranslator.json_to_ruby(record_hashes).first
      new(raw)
    end

    def self.all
      payload = Accela::V4::GetAllRecords.call
      record_hashes = payload["result"]
      raws = RecordTranslator.json_to_ruby(record_hashes)
      raws.map {|raw| new(raw) }
    end

    def create
      payload = RecordTranslator.ruby_to_json([raw])
      create_payload = Accela::V4::CreateRecord.call(payload.first)
      record_hash = create_payload["result"]
      raw = RecordTranslator.json_to_ruby([record_hash]).first
      update(raw)
      self
    end

  end
end
