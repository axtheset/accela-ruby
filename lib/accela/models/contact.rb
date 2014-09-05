module Accela
  class Contact < Model
    has_one :address, :birth_city, :birth_region, :birth_state,
            :driver_license_state, :gender, :preferred_channel, :race,
            :record_id, :relation, :salutation, :status, :type

    def self.all
      payload = Accela::V4::GetAllContacts.call
      contact_hashes = payload["result"]
      raws = ContactTranslator.json_to_ruby(contact_hashes)
      raws.map {|raw| create(raw) }
    end

  end
end
