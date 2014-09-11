module Accela
  class Owner < Model
    has_one :owner, :mail_owner, :record_id, :status

    def self.find(id)
      owner_hashes = Accela::V4::GetOwners.result(id)
      input_hash = OwnerTranslator.json_to_ruby([owner_hashes]).first
      new(input_hash)
    end

    def self.all
      owner_hashes = Accela::V4::GetAllOwners.result(state: "OH")
      input_hashes = OwnerTranslator.json_to_ruby(owner_hashes)
      input_hashes.map {|input_hash| new(input_hash) }
    end

  end
end
