module Accela
  class ParcelAPI < APIGroup
    as_class_method :get_parcels, :get_all_parcels

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

