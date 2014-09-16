module Accela
  class ContactAPI < APIGroup
    as_class_method :get_all_contacts

    def get_all_contacts(*args)
      fetch_many(Accela::V4::GetAllContacts,
                 ContactTranslator,
                 Contact,
                 *args)
    end

  end
end

