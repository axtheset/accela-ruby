module Accela
  class ElementTypeTranslator < Translator

    def translation
      [
       [:value, :value, :string],
       [:min_occurance, :minOccurance, :integer],
       [:max_occurance, :maxOccurance, :integer]
      ]
    end

  end
end