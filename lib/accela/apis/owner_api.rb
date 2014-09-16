module Accela
  class OwnerAPI < APIGroup
    as_class_method :get_owners, :get_all_owners

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
