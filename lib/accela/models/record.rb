module Accela
  class Record < Model
    has_one :type
    has_many :addresses, :contacts, :parcels, :owners
  end
end
