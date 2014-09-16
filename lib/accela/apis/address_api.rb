module Accela
  class AddressAPI < APIGroup
    as_class_method :get_addresses, :get_all_addresses

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
