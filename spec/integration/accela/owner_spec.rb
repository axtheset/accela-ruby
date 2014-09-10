require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Owner, :vcr do

  before(:each) do
    api = Accela::API.connection
    api.login("developer", "accela", "owners")
  end

  describe "::all" do
    it "returns a list of Owner objects" do
      owners = Accela::Owner.all
      expect(owners.length).to eq 3
    end
  end

  describe "::find" do
    it "returns a single Owner object" do
      owner = Accela::Owner.find(4823151)
      expect(owner.full_name).to eq "TAYLOR CYNTHIA"
      expect(owner.is_primary).to eq "Y"
    end
  end

end
