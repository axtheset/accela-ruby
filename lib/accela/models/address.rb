module Accela
  class Address < Model
    has_one :address_type_flag
    has_one :country
    has_one :direction
    has_one :house_fraction_end
    has_one :house_fraction_start
    has_one :state
    has_one :status
    has_one :street_suffix_direction
    has_one :street_suffix
    has_one :unit_type

    def self.find(id)
      payload = Accela::V4::GetAddresses.call(id)
      address_hashes = payload["result"]
      raw = AddressTranslator.json_to_ruby([address_hashes]).first
      new(raw)
    end

    def self.all
      payload = Accela::V4::GetAllAddresses.call(country: "US")
      address_hashes = payload["result"]
      raws = AddressTranslator.json_to_ruby(address_hashes)
      raws.map {|raw| new(raw) }
    end

  end
end
