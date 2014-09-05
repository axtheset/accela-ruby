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
      record.housing_units = 647
      expect(record.housing_units).to eq 647
      record_take_2 = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      expect(record_take_2.housing_units).not_to eq 647
    end
  end

  describe "#update" do
    let(:record) {
      Accela::Record.new(housing_units: 12,
                         cost_per_unit: 199.99,
                         estimated_total_job_cost: 122.09)
    }

    it "merges new properties with existing properties" do
      record.update(cost_per_unit: 55.55, job_value: 98.23)
      expect(record.cost_per_unit).to eq 55.55
      expect(record.job_value).to eq 98.23
      expect(record.housing_units).to eq 12
    end

    it "raises an error when given an unknown property" do
      error = Accela::UnknownAttributeError
      expect { record.update(oops: true) }.to raise_error(error)
    end
  end

  describe "#create" do
    it "persists changes to the model" do
      record = Accela::Record.new
      record.housing_units = 829
      type = Accela::Type.new
      type.id = "Building-Commercial-Addition-NA"
      record.type = type
      record.create
      expect(record.housing_units).to eq 829
    end

    it "creates and sets an id" do
      record = Accela::Record.new
      type = Accela::Type.new
      type.id = "Building-Commercial-Addition-NA"
      record.type = type
      record.create
      expect(record.id).not_to eq nil
    end

    it "raises an error when attempting to create an already created record" do
      record = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      expect { record.create }.to raise_error Accela::ModelPersistenceError
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

    it "embeds raw values when assigning has_manys" do
      type = Accela::Type.new(input.fetch(:type))
      rec = Accela::Record.new
      rec.type = type
      expect(rec.raw[:type][:text]).to eq "This is a text"
      expect(rec.type.text).to eq "This is a text"
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

    it "embeds raw values when assigning has_manys" do
      raw_addresses = input.fetch(:addresses)
      addresses = raw_addresses.map {|hash| Accela::Address.new(hash) }
      rec = Accela::Record.new
      rec.addresses = addresses
      expect(rec.raw[:addresses].first[:city]).to eq "Cleveland"
      expect(rec.addresses.last.county).to eq "Geauga"
    end
  end

  describe "::new" do
    it "throws an error when given a key that doesn't belong to its schema" do
      input = { oops: true }
      error = Accela::UnknownAttributeError
      expect { Accela::Record.new(input) }.to raise_error(error)
    end
  end

  describe "type mismatches" do
    let(:error) { Accela::TypeMismatchError }
    let(:record) { Accela::Record.new }

    it "throws an error when assigning the wrong types" do
      expect { record.type = "String instead of a Accela::Type" }.to raise_error(error)
    end

    it "throws an error when assigning wrong non-primative types" do
      address = Accela::Address.new
      expect { record.type = address }.to raise_error(error)
    end
  end

  describe "#created?" do
    it "defaults to false for manually created records" do
      record = Accela::Record.new
      expect(record.created?).to be false
    end

    it "returns true for fetched records" do
      record = Accela::Record.all.first
      expect(record.created?).to be true
      record_2 = Accela::Record.find("ISLANDTON-14CAP-00000-000CR")
      expect(record_2.created?).to be true
    end

    it "returns true for records that have called created" do
      record = Accela::Record.new
      type = Accela::Type.new
      type.id = "Building-Commercial-Addition-NA"
      record.type = type
      record.create
      expect(record.created?).to be true
    end
  end
end
