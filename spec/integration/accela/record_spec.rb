require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Record, :vcr do

  before(:each) do
    api = Accela::API.connection
    api.login("developer", "accela", "records addresses")
  end

  describe "::find" do
    it "returns a single Record object" do
      record = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      expect(record.initiated_product).to eq "AV360"
      expect(record.public_owned).to eq false
    end
  end

  describe "::all" do
    it "returns a list of Record objects" do
      records = Accela::Record.all
      expect(records.length).to eq 25
    end
  end

  describe "updating a record's attributes" do
    it "allows its properties to be updated" do
      record = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      record.name = "This is a test"
      expect(record.name).to eq "This is a test"
    end

    it "does not persist changes" do
      record = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      record.module = "This is a test"
      expect(record.module).to eq "This is a test"
      record_take_2 = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      expect(record_take_2.module).not_to eq "This is a test"
    end
  end

  describe "#save" do
    xit "persists changes to the model" do
      record = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      record.module = "This is a test"
      record.save
      expect(record.module).to eq "This is a test"
      record_take_2 = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      expect(record_take_2.module).to eq "This is a test"
    end
  end

  describe "::has_one" do
    let(:input) {
      {
        balance: 123.45,
        type: {
          text: "This is a text",
          value: "Value discounts",
          sub_type: "Nuclear"
        }
      }
    }

    let(:record) { Accela::Record.new(input) }

    it "exposes sub-objects" do
      expect(record.type.text).to eq "This is a text"
    end
  end

  describe "::has_many" do
    let(:input) {
      {
        balance: 123.45,
        addresses: [{
          city: "Cleveland",
          county: "Cuyahoga"
        }, {
          city: "Bainbridge Township",
          county: "Geauga"
        }]
      }
    }

    let(:record) { Accela::Record.new(input) }

    it "exposes sub-objects in an array" do
      address1, address2 = record.addresses
      expect(address1.city).to eq "Cleveland"
      expect(address2.city).to eq "Bainbridge Township"
    end
  end

  describe "::new" do
    it "throws an error when given a key that doesn't belong to its schema" do
      input = { oops: true }
      error = Accela::UnknownAttributeError
      expect { Accela::Record.new(input) }.to raise_error(error)
    end
  end
end
