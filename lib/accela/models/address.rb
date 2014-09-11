module Accela
  class Address < Model
    has_one :address_type_flag, :country, :direction, :house_fraction_end,
            :house_fraction_start, :state, :status, :street_suffix_direction,
            :street_suffix, :unit_type

    def self.find(id)
      address_hashes = Accela::V4::GetAddresses.result(id)
      input_hash = AddressTranslator.json_to_ruby([address_hashes]).first
      new(input_hash)
    end

    def self.all
      address_hashes  = Accela::V4::GetAllAddresses.result(country: "US")
      input_hashes = AddressTranslator.json_to_ruby(address_hashes)
      input_hashes.map {|input_hash| new(input_hash) }
    end

  end
end
