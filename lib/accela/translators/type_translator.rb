module Accela
  class TypeTranslator < Translator

    def translation
      [
        [:category, :category, :string],
        [:group, :group, :string],
        [:id, :id, :string],
        [:module, :module, :string],
        [:sub_type, :subType, :string],
        [:text, :text, :string],
        [:type, :type, :string],
        [:value, :value, :string]
      ]
    end

  end
end

