module Accela
  class RecordIdTranslator < Translator

    def translation
      [
        [:custom_id, :customId, :string],
        [:id, :id, :string],
        [:service_provider_code, :serviceProviderCode, :string],
        [:tracking_id, :trackingId, :integer]
      ]
    end

  end
end
