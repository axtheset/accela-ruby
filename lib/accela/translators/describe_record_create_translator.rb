module Accela
  class DescribeRecordCreateTranslator < Translator

    def translation
      [
       [:fields, :fields, [:Field]],
       [:elements, :elements, [:Element]] 
      ]
    end

  end
end