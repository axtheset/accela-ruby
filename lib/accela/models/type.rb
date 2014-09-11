module Accela
  class Type < Model

    def self.all
      record_hashes = Accela::V4::GetAllRecordTypes.result
      input_hashes = TypeTranslator.json_to_ruby(record_hashes)
      input_hashes.map {|input_hash| new(input_hash) }
    end
  end
end
