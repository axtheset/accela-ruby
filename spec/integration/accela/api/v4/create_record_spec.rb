require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Accela::API::V4::CreateRecord, :vcr do
  describe "::call" do

    xit "updates attributes on a record" do
      api = Accela::API.connection
      api.login("mdeveloper", "accela", "create_record")
      id = "ISLANDTON-Test-#{SecureRandom.uuid}"
      payload = Accela::API::V4::CreateRecord.call({
        "actualProductionUnit" => 123.43
      })
      expect(payload["result"]["actualProductionUnit"]).to eq 123.43
    end

  end
end
