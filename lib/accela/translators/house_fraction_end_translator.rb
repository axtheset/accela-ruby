module Accela
  class HouseFractionEndTranslator < Translator

    def translation
      [
        [:text, :text, :string],
        [:value, :value, :string]
      ]
    end

  end
end
