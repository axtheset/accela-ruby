module Accela
  class FieldTranslator < Translator

    def translation
      [
       [:name, :name, :string],
       [:is_required, :isRequired, :boolean] 
      ]
    end

  end
end