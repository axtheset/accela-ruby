module Accela
  class Contact < Model
    has_one :address, :birth_city, :birth_region, :birth_state,
            :driver_license_state, :gender, :preferred_channel, :race,
            :record_id, :relation, :salutation, :status, :type
  end
end
