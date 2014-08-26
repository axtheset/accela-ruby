module Accela
  class AddressTypeFlagTranslator < Translator

    def translation
      [
        [:text, :text, :string],
        [:value, :value, :string]
      ]
    end

  end
end
