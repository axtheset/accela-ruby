require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Accela::API::V4::GetRecords, :vcr do
  describe "::call" do

    xit "updates attributes on a record" do
      api = Accela::API.connection
      api.login("developer", "accela", "records addresses")
      id = "ISLANDTON-DUB14-00000-0000I"
      payload = Accela::API::V4::UpdateRecord.call(id, { "id" => id, "serviceProviderCode" => "testing123" })
      expect(payload["result"]["serviceProviderCode"]).to eq "testing123"
    end

  end
end
