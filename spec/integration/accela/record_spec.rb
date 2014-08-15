require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Record, :vcr do

  before(:each) do
    api = Accela::API.connection
    api.login("developer", "accela", "records addresses")
  end

  describe "::find" do
    it "returns a single Record object" do
      record = Accela::Record.find("ISLANDTON-DUB14-00000-0000H")
      expect(record.initiated_product).to eq "AV360"
      expect(record.public_owned).to eq false
    end
  end

  describe "::all" do
    it "returns a list of Record objects" do
      records = Accela::Record.all
      expect(records.length).to eq 13
    end
  end

  describe "updating a record's attributes" do
    it "allows its properties to be updated" do
      record = Accela::Record.find("ISLANDTON-DUB14-00000-0000H")
      record.name = "This is a test"
      expect(record.name).to eq "This is a test"
    end

    it "does not persist changes" do
      record = Accela::Record.find("ISLANDTON-DUB14-00000-0000H")
      record.module = "This is a test"
      expect(record.module).to eq "This is a test"
      record_take_2 = Accela::Record.find("ISLANDTON-DUB14-00000-0000H")
      expect(record_take_2.module).not_to eq "This is a test"
    end
  end

end
