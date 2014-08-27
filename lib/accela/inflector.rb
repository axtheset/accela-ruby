module Accela
  module Inflector

    def model_for_name(name)
      constantize(classify(name))
    end

    def translator_for_name(name)
      constantize(classify(name) + 'Translator')
    end

    def classify(name)
      name.to_s.classify
    end

    def pluralize(name)
      name.to_s.pluralize
    end

    def singularize(name)
      name.to_s.singularize
    end

    def underscore(name)
      name.to_s.underscore
    end

    def constantize(name, namespace='Accela::')
      (namespace + name).constantize
    end

  end
end
