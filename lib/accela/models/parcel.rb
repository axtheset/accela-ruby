module Accela
  class Parcel < Model
    has_one :record_id
    has_one :status
    has_one :subdivision

    def self.find(id)
      payload = Accela::V4::GetParcels.call(id)
      parcel_hashes = payload["result"]
      raw = ParcelTranslator.json_to_ruby([parcel_hashes]).first
      new(raw)
    end

    def self.all
      payload = Accela::V4::GetAllParcels.call(isPrimary: "N")
      parcel_hashes = payload["result"]
      raws = ParcelTranslator.json_to_ruby(parcel_hashes)
      raws.map {|raw| new(raw) }
    end

  end
end

