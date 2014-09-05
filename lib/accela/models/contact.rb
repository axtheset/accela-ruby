module Accela
  class Contact < Model
    has_one :address
    has_one :birth_city
    has_one :birth_region
    has_one :birth_state
    has_one :driver_license_state
    has_one :gender
    has_one :preferred_channel
    has_one :race
    has_one :record_id
    has_one :relation
    has_one :salutation
    has_one :status
    has_one :type
  end
end
