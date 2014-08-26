module Accela
  class AddressTranslator < Translator

    def translation
      [
        [:address_line_1, :addressLine1, :string],
        [:address_line_2, :addressLine2, :string],
        [:address_type_flag, :addressTypeFlag, :AddressTypeFlag],
        [:audit_status, :auditStatus, :string],
        [:city, :city, :string],
        [:country, :country, :Country],
        [:county, :county, :string],
        [:description, :description, :string],
        [:direction, :direction, :Direction],
        [:distance, :distance, :double],
        [:house_alpha_end, :houseAlphaEnd, :string],
        [:house_alpha_start, :houseAlphaStart, :string],
        [:house_fraction_end, :houseFractionEnd, :HouseFractionEnd],
        [:house_fraction_start, :houseFractionStart, :HouseFractionStart],
        [:id, :id, :integer],
        [:inspection_district, :inspectionDistrict, :string],
        [:inspection_district_prefix, :inspectionDistrictPrefix, :string],
        [:is_primary, :isPrimary, :string],
        [:level_end, :levelEnd, :string],
        [:level_prefix, :levelPrefix, :string],
        [:level_start, :levelStart, :string],
        [:neighborhood, :neighborhood, :string],
        [:neighborhood_prefix, :neighborhoodPrefix, :string],
        [:postal_code, :postalCode, :string],
        [:secondary_street, :secondaryStreet, :string],
        [:secondary_street_number, :secondaryStreetNumber, :integer],
        [:source_flag, :sourceFlag, :string],
        [:source_number, :sourceNumber, :integer],
        [:state, :state, :State],
        [:status, :status, :Status],
        [:street_address, :streetAddress, :string],
        [:street_end, :streetEnd, :integer],
        [:street_name, :streetName, :string],
        [:street_prefix, :streetPrefix, :string],
        [:street_start, :streetStart, :integer],
        [:street_suffix, :streetSuffix, :StreetSuffix],
        [:street_suffix_direction, :streetSuffixDirection, :StreetSuffixDirection],
        [:unit_end, :unitEnd, :string],
        [:unit_start, :unitStart, :string],
        [:unit_type, :unitType, :UnitType],
        [:x_coordinate, :xCoordinate, :double],
        [:y_coordinate, :yCoordinate, :double]
      ]
    end

  end
end
