module Accela
  class ParcelTranslator < Translator

    def translation
      [
        [:block, :block, :string],
        [:book, :book, :string],
        [:census_tract, :censusTract, :string],
        [:council_district, :councilDistrict, :string],
        [:exemption_value, :exemptionValue, :integer],
        [:gis_sequence_number, :gisSequenceNumber, :integer],
        [:id, :id, :string],
        [:improved_value, :improvedValue, :double],
        [:is_primary, :isPrimary, :string],
        [:land_value, :landValue, :double],
        [:legal_description, :legalDescription, :string],
        [:lot, :lot, :string],
        [:map_number, :mapNumber, :string],
        [:map_reference_info, :mapReferenceInfo, :string],
        [:page, :page, :string],
        [:parcel, :parcel, :string],
        [:parcel_area, :parcelArea, :double],
        [:parcel_number, :parcelNumber, :string],
        [:plan_area, :planArea, :string],
        [:range, :range, :string],
        [:record_id, :recordId, :RecordId],
        [:section, :section, :integer],
        [:status, :status, :Status],
        [:subdivision, :subdivision, :Subdivision],
        [:supervisorDistrict, :supervisorDistrict, :string],
        [:township, :township, :string],
        [:tract, :tract, :string]
      ]
    end
  end
end
