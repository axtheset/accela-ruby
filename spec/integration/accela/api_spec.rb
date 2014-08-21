require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::API, :vcr do

  describe "#get" do

    let(:api) { Accela::API.connection }

    it "works with no_auth authentication" do
      response = api.get("/v4/records", :no_auth)
      expect(response.code).to eq 200
    end

    it "works with access_token authentication" do
      id = "ISLANDTON-14CAP-00000-000CR"
      api.login("developer", "accela", "records addresses")
      response = api.get "/v4/records/#{id}", :access_token
      expect(response.code).to eq 200
    end

    it "fails when using the wrong auth type" do
      response = api.get "/v4/records/1234/comments", :no_auth
      expect(response.code).to eq 401
    end

  end

end
