module Accela
  class Type < Model

    def self.all
      payload = Accela::API::V4::GetAllRecordTypes.call
      record_hashes = payload["result"]
      raws = TypeTranslator.json_to_ruby(record_hashes)
      raws.map {|raw| new(raw) }
    end
  end
end
