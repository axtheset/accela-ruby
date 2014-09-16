module Accela
  class ContactAPI < APIGroup

    def self.get_all_contacts(*args)
      new(nil).get_all_contacts(*args)
    end

    def get_all_contacts(*args)
      fetch_many(Accela::V4::GetAllContacts,
                 ContactTranslator,
                 Contact,
                 *args)
    end

  end
end

