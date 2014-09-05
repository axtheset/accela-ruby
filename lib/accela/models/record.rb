module Accela
  class Record < Model
    has_one :type
    has_many :addresses
    has_many :contacts

    def self.find(id)
      payload = Accela::V4::GetRecords.call(id)
      record_hashes = payload["result"]
      raw = RecordTranslator.json_to_ruby(record_hashes).first
      create(raw)
    end

    def self.all
      payload = Accela::V4::GetAllRecords.call
      record_hashes = payload["result"]
      raws = RecordTranslator.json_to_ruby(record_hashes)
      raws.map {|raw| create(raw) }
    end

    def create
      ensure_not_created do
        payload = RecordTranslator.ruby_to_json([raw])
        create_payload = Accela::V4::CreateRecord.call(payload.first)
        record_hash = create_payload["result"]
        raw = RecordTranslator.json_to_ruby([record_hash]).first
        update(raw)
        send(:create_lock!)
        self
      end
    end

    def addresses
      # TODO: implement caching mechanism?
      if created?
        payload = Accela::V4::GetAllAddressesForRecord.call(self.id)
        address_hashes = payload["result"]
        raws = AddressTranslator.json_to_ruby(address_hashes)
        self.addresses = raws.map {|raw| Address.create(raw) }
      else
        super
      end
    end

    def contacts
      # TODO: implement caching mechanism?
      if created?
        payload = Accela::V4::GetAllContactsForRecord.call(self.id)
        contact_hashes = payload["result"]
        raws = ContactTranslator.json_to_ruby(contact_hashes)
        self.contacts = raws.map {|raw| Contact.create(raw) }
      else
        super
      end
    end

  end
end
