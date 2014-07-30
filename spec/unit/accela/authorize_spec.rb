require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Accela::Authorize do

  describe "initialize" do
    let(:auth) {
      Accela::Authorize.new("abcd", "1234", "Twin Peaks", "TEST")
    }

    it "has an app id" do
      expect(auth.app_id).to eq "abcd"
    end

    it "has an app secret" do
      expect(auth.app_secret).to eq "1234"
    end

    it "has an agency" do
      expect(auth.agency).to eq "Twin Peaks"
    end

    it "has an environment" do
      expect(auth.environment).to eq "TEST"
    end

  end

  describe "#login" do
    let(:auth) { Accela::Authorize.new("abcd", "1234", "Twin Peaks", "TEST") }
    let(:end_point) { "https://apis.accela.com/oauth2/token" }

    let(:headers) { {
      "Content-Type" => "application/x-www-form-urlencoded",
      "x-accela-appid" => "abcd"
    } }

    let(:body) { {
      "grant_type" => "password",
      "username" => "dcooper@example.com",
      "password" => "secret",
      "scope" => "records addresses",
      "agency_name" => "Twin Peaks",
      "environment" => "TEST",
      "client_id" => "abcd",
      "client_secret" => "1234"
    } }

    let(:response) {
      double("200 Response", code: 200, parsed_response: "token")
    }

    it "posts to Accela's oath endpoint" do
      expect(HTTParty).to receive(:post).with(end_point, headers: headers, body: body) { response }
      auth.login("dcooper@example.com", "secret", "records addresses")
    end

    context "response is 200" do
      it "returns a token" do
        allow(HTTParty).to receive(:post) { response }
        result = auth.login("dcooper@example.com", "secret", "records addresses")
        expect(result).to eq "token"
      end
    end

    context "response is not 200" do
      it "returns nil" do
        response = double("403 Response", code: 403, parsed_response: "unauthorized")
        allow(HTTParty).to receive(:post) { response }
        result = auth.login("dcooper@example.com", "secret", "records addresses")
        expect(result).to be_nil
      end
    end

  end

end
