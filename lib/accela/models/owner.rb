module Accela
  class Owner < Model
    has_one :owner
    has_one :mail_owner
    has_one :record_id
    has_one :status

    def self.find(id)
      payload = Accela::V4::GetOwners.call(id)
      owner_hashes = payload["result"]
      raw = OwnerTranslator.json_to_ruby([owner_hashes]).first
      new(raw)
    end

    def self.all
      payload = Accela::V4::GetAllOwners.call(state: "OH")
      owner_hashes = payload["result"]
      raws = OwnerTranslator.json_to_ruby(owner_hashes)
      raws.map {|raw| new(raw) }
    end

  end
end
