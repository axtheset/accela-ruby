module Accela
  class Address < Model
    has_one :address_type_flag, :country, :direction, :house_fraction_end,
            :house_fraction_start, :state, :status, :street_suffix_direction,
            :street_suffix, :unit_type
  end
end
