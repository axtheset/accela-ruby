module Accela
  class ParcelAPI < APIGroup

    def self.get_parcels(id)
      new(nil).get_parcels(id)
    end

    def self.get_all_parcels
      new(nil).get_all_parcels(isPrimary: "N")
    end

    def get_parcels(*args)
      fetch_one(Accela::V4::GetParcels,
                ParcelTranslator,
                Parcel,
                *args)
    end

    def get_all_parcels(*args)
      fetch_many(Accela::V4::GetAllParcels,
                 ParcelTranslator,
                 Parcel,
                 *args)
    end

  end
end

