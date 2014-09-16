require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::OwnerAPI, :vcr do

  before(:each) do
    api = Accela::API.connection
    api.login("developer", "accela", "owners")
  end

  describe "::get_all_owners" do
    it "returns a list of Owner objects" do
      owners = Accela::OwnerAPI.get_all_owners state: "OH"
      expect(owners.length).to eq 3
    end
  end

  describe "::get_owners" do
    it "returns a single Owner object" do
      owner = Accela::OwnerAPI.get_owners(4823151)
      expect(owner.full_name).to eq "TAYLOR CYNTHIA"
      expect(owner.is_primary).to eq "Y"
    end
  end

end
