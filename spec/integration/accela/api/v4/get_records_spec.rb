require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Accela::API::V4::GetRecords, :vcr do
  describe "::call" do

    it "returns a single record when given a single id" do
      api = Accela::API.connection
      api.login("mdeveloper", "accela", "records addresses")
      id = "ISLANDTON-14CAP-00000-000CI"
      payload = Accela::API::V4::GetRecords.call(id)
      expect(payload["result"].length).to eq 1
    end

    it "returns multiple records when given a multiple ids" do
      api = Accela::API.connection
      api.login("mdeveloper", "accela", "records addresses")
      id1 = "ISLANDTON-14CAP-00000-000CR"
      id2 = "ISLANDTON-14CAP-00000-000CQ"
      payload = Accela::API::V4::GetRecords.call(id1, id2)
      expect(payload["result"].length).to eq 2
    end

  end
end
