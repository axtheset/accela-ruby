module Accela
  class MailAddressTranslator < Translator

    def translation
      [
        [:address_line1, :addressLine1, :string],
        [:address_line2, :addressLine2, :string],
        [:address_line3, :addressLine3, :string],
        [:city, :city, :string],
        [:country, :country, :Country],
        [:postal_code, :postalCode, :string],
        [:state, :state, :State]
      ]
    end

  end
end

