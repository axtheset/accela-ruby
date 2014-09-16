module Accela
  class APIGroup
    attr_reader :model

    def initialize(model)
      @model = model
    end

    private

    def fetch_has_many(api_class, translator_class, model_class)
      fetch_many(api_class, translator_class, model_class, model.id)
    end

    def fetch_many(api_class, translator_class, model_class, *args)
      payload_hashes = api_class.result(*args)
      input_hashes = translator_class.json_to_ruby(payload_hashes)
      input_hashes.map {|input_hash| model_class.create(input_hash) }
    end

  end
end
