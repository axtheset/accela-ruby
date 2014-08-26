module Accela
  class StreetSuffixDirectionTranslator < Translator

    def translation
      [
        [:text, :text, :string],
        [:value, :value, :string]
      ]
    end

  end
end
