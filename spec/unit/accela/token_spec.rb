require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Accela::Token do

  let(:input) { {
    "access_token" => "abcd124",
    "token_type" => "auth",
    "expires_in" => "1080",
    "refresh_token" => "1234abcd",
    "scope" => "records"
  } }

  let(:created_at) { DateTime.new(2014, 7, 31, 8, 32, 12, "EDT") }
  let(:token) { Accela::Token.new(input, created_at) }

  describe "#initialize" do

    it "accepts a token hash from Accela's REST API and sets accessors" do
      expect(token.access_token).to eq "abcd124"
      expect(token.token_type).to eq "auth"
      expect(token.expires_in).to eq 1080
      expect(token.refresh_token).to eq "1234abcd"
      expect(token.scope).to eq "records"
    end
  end

  describe "#expires_at" do
    it "returns a DateTime when the token will expire" do
      expires = DateTime.new(2014, 7, 31, 8, 50, 12, "EDT")
      expect(token.expires_at).to eq expires
    end
  end

  describe "#expired?" do
    context "before expiration" do
      let(:now) { DateTime.new(2014, 7, 31, 8, 50, 11, "EDT") }

      it "returns false" do
        expect(token.expired?(now)).to eq false
      end
    end

    context "after expiration" do
      let(:now) { DateTime.new(2014, 7, 31, 9, 3, 48, "EDT") }

      it "returns true" do
        expect(token.expired?(now)).to eq true
      end
    end
  end

end
