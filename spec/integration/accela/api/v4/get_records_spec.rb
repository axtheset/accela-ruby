require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Accela::API::V4::GetRecords, :vcr do
  describe "::call" do

    it "returns a single record when given a single id" do
      api = Accela::API.connection
      api.login("developer", "accela", "records addresses")
      id = "ISLANDTON-DUB14-00000-0000H"
      payload = Accela::API::V4::GetRecords.call(id)
      expect(payload["result"].length).to eq 1
    end

    it "returns multiple records when given a multiple ids" do
      api = Accela::API.connection
      api.login("developer", "accela", "records addresses")
      id1 = "ISLANDTON-DUB14-00000-0000H"
      id2 = "ISLANDTON-DUB14-00000-0000G"
      payload = Accela::API::V4::GetRecords.call(id1, id2)
      expect(payload["result"].length).to eq 2
    end

  end
end
