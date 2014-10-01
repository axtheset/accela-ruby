module Accela
  class Element < Model
    has_many :types, model: ElementType
  end
end
