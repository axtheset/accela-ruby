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

    # def addresses
      # unless raw.has_key?(:addresses)
        # payload = Accela::V4::GetAllAddressesForRecord.call(id)
        # address_hashes = payload["result"]
        # raws = AddressTranslator.json_to_ruby(address_hashes)
        # raw[:addresses] = raws
      # else
        # raw[:addresses]
      # end
      # # TODO: Implement has_many relationships and return
      # #       real address model objects and not hashes!
    # end

  end
end
