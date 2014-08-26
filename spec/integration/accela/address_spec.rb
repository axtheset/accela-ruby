require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Address, :vcr do

  before(:each) do
    api = Accela::API.connection
    api.login("developer", "accela", "addresses")
  end

  describe "::all" do
    it "returns a list of Address objects" do
      addresses = Accela::Address.all
      expect(addresses.length).to eq 25
    end
  end

  describe "::find" do
    it "returns a single Address object" do
      address = Accela::Address.find(2)
      expect(address.street_name).to eq "LINDBERG"
      expect(address.city).to eq "PETALUMA"
    end
  end

  describe "::has_one" do
    let(:input) {
      {
        is_primary: "Y",
        country: {
          value: "US",
          text: "United States"
        },
        street_suffix: {
          value: "LN",
          text: "LN"
        }
      }
    }

    let(:address) { Accela::Address.new(input) }

    it "exposes sub-objects" do
      expect(address.country.text).to eq "United States"
      expect(address.street_suffix.text).to eq "LN"
    end
  end

end
