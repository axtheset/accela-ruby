module Accela
  class OwnerAPI < APIGroup

    def self.get_owners(id)
      new(nil).get_owners(id)
    end

    def self.get_all_owners(*args)
      new(nil).get_all_owners(*args)
    end

    def self.find(id)
    end

    def get_owners(*args)
      fetch_one(Accela::V4::GetOwners,
                OwnerTranslator,
                Owner,
                *args)
    end

    def get_all_owners(*args)
      fetch_many(Accela::V4::GetAllOwners,
                 OwnerTranslator,
                 Owner,
                 *args)
    end

  end
end
