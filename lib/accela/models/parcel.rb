module Accela
  class Parcel < Model
    has_one :record_id, :status, :subdivision

    def self.find(id)
      parcel_hashes = Accela::V4::GetParcels.result(id)
      input_hash = ParcelTranslator.json_to_ruby([parcel_hashes]).first
      new(input_hash)
    end

    def self.all
      parcel_hashes = Accela::V4::GetAllParcels.result(isPrimary: "N")
      input_hashes = ParcelTranslator.json_to_ruby(parcel_hashes)
      input_hashes.map {|input_hash| new(input_hash) }
    end

  end
end

