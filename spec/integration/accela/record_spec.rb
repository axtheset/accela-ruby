require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Record, :vcr do

  describe "::find" do
    it "does stuff" do
      api = Accela::API.connection
      api.login("developer", "accela", "records addresses")
      record = Accela::Record.find("ISLANDTON-DUB14-00000-0000H")
      expect(record.initiated_product).to eq "AV360"
      expect(record.public_owned).to eq false
    end
  end

end
