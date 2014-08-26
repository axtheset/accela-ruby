module Accela
  class DirectionTranslator < Translator

    def translation
      [
        [:text, :text, :string],
        [:value, :value, :string]
      ]
    end

  end
end
