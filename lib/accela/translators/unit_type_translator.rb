module Accela
  class UnitTypeTranslator < Translator

    def translation
      [
        [:value, :value, :string],
        [:text, :text, :string]
      ]
    end

  end
end
