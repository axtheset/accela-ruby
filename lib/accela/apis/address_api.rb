module Accela
  class AddressAPI < APIGroup

    def self.get_addresses(id)
      new(nil).get_addresses(id)
    end

    def self.get_all_addresses(*args)
      new(nil).get_all_addresses(*args)
    end

    def get_addresses(*args)
      fetch_one(Accela::V4::GetAddresses,
                AddressTranslator,
                Address,
                *args)
    end

    def get_all_addresses(*args)
      fetch_many(Accela::V4::GetAllAddresses,
                 AddressTranslator,
                 Address,
                 *args)
    end

  end
end
