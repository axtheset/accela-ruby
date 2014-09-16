require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Accela::Record, :vcr do

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
