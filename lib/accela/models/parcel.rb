module Accela
  class Parcel < Model
    has_one :record_id
    has_one :status
    has_one :subdivision

    # def self.find(id)
      # payload = Accela::V4::GetAddresses.call(id)
      # address_hashes = payload["result"]
      # raw = AddressTranslator.json_to_ruby([address_hashes]).first
      # new(raw)
    # end

    # def self.all
      # payload = Accela::V4::GetAllAddresses.call(country: "US")
      # address_hashes = payload["result"]
      # raws = AddressTranslator.json_to_ruby(address_hashes)
      # raws.map {|raw| new(raw) }
    # end

  end
end

