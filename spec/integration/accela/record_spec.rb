require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Record, :vcr do

  describe "::find" do
    it "returns a single Record object" do
      api = Accela::API.connection
      api.login("developer", "accela", "records addresses")
      record = Accela::Record.find("ISLANDTON-DUB14-00000-0000H")
      expect(record.initiated_product).to eq "AV360"
      expect(record.public_owned).to eq false
    end
  end

  describe "::all" do
    it "returns a list of Record objects" do
      api = Accela::API.connection
      api.login("developer", "accela", "records addresses")
      records = Accela::Record.all
      expect(records.length).to eq 13
    end
  end

end
