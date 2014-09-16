module Accela
  class Owner < Model
    has_one :owner, :mail_owner, :record_id, :status
  end
end
