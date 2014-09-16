module Accela
  class Parcel < Model
    has_one :record_id, :status, :subdivision
  end
end

