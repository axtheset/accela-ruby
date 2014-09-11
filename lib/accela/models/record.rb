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
        address_hashes  = Accela::V4::GetAllAddressesForRecord.result(self.id)
        input_hashes = AddressTranslator.json_to_ruby(address_hashes)
        self.addresses = input_hashes.map {|input_hash| Address.create(input_hash) }
      else
        super
      end
    end

    def contacts
      # TODO: implement caching mechanism?
      if created?
        contact_hashes  = Accela::V4::GetAllContactsForRecord.result(self.id)
        input_hashes = ContactTranslator.json_to_ruby(contact_hashes)
        self.contacts = input_hashes.map {|input_hash| Contact.create(input_hash) }
      else
        super
      end
    end

    def owners
      # TODO: implement caching mechanism?
      if created?
        owner_hashes = Accela::V4::GetAllOwnersForRecord.result(self.id)
        input_hashes = OwnerTranslator.json_to_ruby(owner_hashes)
        self.owners = input_hashes.map {|input_hash| Owner.create(input_hash) }
      else
        super
      end
    end

    def parcels
      # TODO: implement caching mechanism?
      if created?
        parcel_hashes  = Accela::V4::GetAllParcelsForRecord.result(self.id)
        input_hashes = ParcelTranslator.json_to_ruby(parcel_hashes)
        self.parcels = input_hashes.map {|input_hash| Parcel.create(input_hash) }
      else
        super
      end
    end

  end
end
