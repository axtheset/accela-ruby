module Accela
  class ElementTranslator < Translator

    def translation
      [
       [:name, :name, :string],
       [:is_required, :isRequired, :boolean],
       [:is_reference, :isReference, :boolean],
       [:types, :types, [:ElementType]]
      ]
    end

  end
end