require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Accela::V4::CreateRecord, :vcr do
  describe "::call" do

    it "updates attributes on a record" do
      api = Accela::API.connection
      api.login("mdeveloper", "accela", "create_record")
      payload = Accela::V4::CreateRecord.call({
        "actualProductionUnit" => 123.43,
        "type" => {
          "id"=>"AMS-Facility-Boiler-Preventative.cMaintenance"
        }
      })
      expect(payload["result"]["actualProductionUnit"]).to eq 123.43
    end

  end
end
