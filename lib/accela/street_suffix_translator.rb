module Accela
  class StreetSuffixTranslator < Translator

    def translation
      [
        [:text, :text, :string],
        [:value, :value, :string]
      ]
    end

  end
end
