module Accela
  class OwnerTranslator < Translator

    def translation
      [
        [:address, :address, :Address],
        [:email, :email, :string],
        [:fax, :fax, :string],
        [:first_name, :firstName, :string],
        [:full_name, :fullName, :string],
        [:id, :id, :integer],
        [:is_primary, :isPrimary, :string],
        [:last_name, :lastName, :string],
        [:mail_address, :mailAddress, :MailAddress],
        [:middle_name, :middleName, :string],
        [:parcel_id, :parcelId, :string],
        [:phone, :phone, :string],
        [:phone_country_code, :phoneCountryCode, :string],
        [:record_id, :recordId, :RecordId],
        [:source_number, :sourceNumber, :integer],
        [:status, :status, :Status],
        [:structure_name, :structureName, :string],
        [:structure_type, :structureType, :string],
        [:tax_id, :taxId, :string],
        [:title, :title, :string]
      ]
    end

  end
end
