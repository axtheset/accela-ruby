require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::RecordAPI, :vcr do

  before(:each) do
    api = Accela::API.connection
    api.login("developer", "accela", "records addresses")
  end

  describe "::get_records" do
    it "returns Record objects" do
      record = Accela::RecordAPI.get_records("ISLANDTON-14CAP-00000-000CR").first
      expect(record.initiated_product).to eq "AV360"
      expect(record.public_owned).to eq false
    end
  end

  describe "::get_all_records" do
    it "returns a list of RecordAPI objects" do
      records = Accela::RecordAPI.get_all_records
      expect(records.length).to eq 25
    end
  end

  describe "#create_record" do
    it "persists changes to the model" do
      input_record = Accela::Record.new housing_units: 829,
                                        type: {
                                          id: "Building-Commercial-Addition-NA"
                                        }
      record = Accela::RecordAPI.create_record(input_record)
      expect(record.housing_units).to eq 829
    end

    it "creates and sets an id" do
      input_record = Accela::Record.new type: {id: "Building-Commercial-Addition-NA" }
      record = Accela::RecordAPI.create_record(input_record)
      expect(record.id).not_to eq nil
    end
  end

  describe "#get_all_addresses_for_record" do
    it "if it has an id fetches a record's set of addresses" do
      record = Accela::RecordAPI.get_records("ISLANDTON-14CAP-00000-000CR").first
      address = Accela::RecordAPI.new(record).get_all_addresses_for_record.first
      expect(address.street_name).to eq "ALLEGHENY"
    end
  end

  describe "#get_all_contacts_for_record" do
    it "fetch a record's contacts" do
      record = Accela::RecordAPI.get_records("ISLANDTON-14CAP-00000-000CR").first
      contact = Accela::RecordAPI.new(record).get_all_contacts_for_record.first
      expect(contact.email).to eq "josh@d-i.co"
    end
  end

  describe "#get_all_parcels_for_record" do
    it "fetch a record's parcels" do
      record = Accela::RecordAPI.get_records("ISLANDTON-14CAP-00000-000CR").first
      parcel = Accela::RecordAPI.new(record).get_all_parcels_for_record.first
      expect(parcel.parcel_number).to eq "137200001"
    end
  end

  describe "#get_all_owners_for_record" do
    it "fetch a record's parcels" do
      record = Accela::RecordAPI.get_records("ISLANDTON-14CAP-00000-000CR").first
      owner = Accela::RecordAPI.new(record).get_all_owners_for_record.first
      expect(owner.full_name).to eq "UTROSKE ROBERT EARL & DIANA LEE"
    end
  end
end
