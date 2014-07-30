require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Authorize, :vcr do
  it "returns an access token, a refresh token and additional information" do
    app_id = "635395466279594650"
    app_secret ="3b1e4026d95e4478a0f8dd1f7a1b7028"
    agency = "ISLANDTON-APP"
    environment = "TEST"

    username = "developer"
    password = "accela"
    scope = "records addresses"

    auth = Accela::Authorize.new(app_id, app_secret, agency, environment)
    token = auth.login(username, password, scope)

    expect(token.access_token).to be_truthy
    expect(token.token_type).to be_truthy
    expect(token.expires_in).to be_truthy
    expect(token.refresh_token).to be_truthy
    expect(token.scope).to be_truthy
  end
end
