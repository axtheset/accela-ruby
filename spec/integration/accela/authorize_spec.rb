require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Authorize, :vcr do
  let(:app_id) { "635395466279594650" }
  let(:app_secret) {"3b1e4026d95e4478a0f8dd1f7a1b7028" }
  let(:agency) { "ISLANDTON-APP" }
  let(:environment) { "TEST" }
  let(:username) { "developer" }
  let(:password) { "accela" }
  let(:scope) { "records addresses" }

  let(:config) {
    Accela::Configuration.new(
      app_id: app_id,
      app_secret: app_secret,
      agency: agency,
      environment: environment
    )
  }

  let(:auth) { Accela::Authorize.new(config) }
  let(:token) { auth.login(username, password, scope) }

  context "valid credentials" do
    it "returns an access token, a refresh token and additional information" do
      expect(token.access_token).to be_truthy
      expect(token.token_type).to be_truthy
      expect(token.expires_in).to be_truthy
      expect(token.refresh_token).to be_truthy
      expect(token.scope).to be_truthy
    end
  end

  context "invalid credentials" do
    let(:password) { "oops" }
    it "returns nil" do
      expect(token).to be_nil
    end
  end
end
