module Accela
  class Record < Model
    has_one :type
    has_many :addresses, :contacts, :parcels, :owners

    def self.find(id)
      record_hashes  = Accela::V4::GetRecords.result(id)
      input_hash = RecordTranslator.json_to_ruby(record_hashes).first
      create(input_hash)
    end

    def self.all
      record_hashes  = Accela::V4::GetAllRecords.result
      input_hashes = RecordTranslator.json_to_ruby(record_hashes)
      input_hashes.map {|input_hash| create(input_hash) }
    end

    def create
      ensure_not_created do
        payload = RecordTranslator.ruby_to_json([raw])
        record_hash  = Accela::V4::CreateRecord.result(payload.first)
        input_hash = RecordTranslator.json_to_ruby([record_hash]).first
        update(input_hash)
        send(:create_lock!)
        self
      end
    end

    def addresses
      # TODO: implement caching mechanism?
      if created?
        self.addresses = fetch_has_many(Accela::V4::GetAllAddressesForRecord,
                                        AddressTranslator,
                                        Address)
      else
        super
      end
    end

    def contacts
      # TODO: implement caching mechanism?
      if created?
        self.contacts = fetch_has_many(Accela::V4::GetAllContactsForRecord,
                                       ContactTranslator,
                                       Contact)
      else
        super
      end
    end

    def owners
      # TODO: implement caching mechanism?
      if created?
        self.owners = fetch_has_many(Accela::V4::GetAllOwnersForRecord,
                                     OwnerTranslator,
                                     Owner)
      else
        super
      end
    end

    def parcels
      # TODO: implement caching mechanism?
      if created?
        self.parcels = fetch_has_many(Accela::V4::GetAllParcelsForRecord,
                                      ParcelTranslator,
                                      Parcel)
      else
        super
      end
    end

  end
end
