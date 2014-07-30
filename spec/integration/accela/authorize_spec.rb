require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Authorize do
  it "returns an access token, a refresh token and additional information" do
    app_id = "635395466279594650"
    app_secret ="3b1e4026d95e4478a0f8dd1f7a1b7028"
    agency = "ISLANDTON-APP"
    environment = "TEST"

    username = "developer"
    password = "accela"
    scope = "records addresses"

    auth = Accela::Authorize.new(app_id, app_secret, agency, environment)
    response = auth.login(username, password, scope)

    expected_keys = ["access_token", "token_type", "expires_in",
                     "refresh_token", "scope"]

    expected_keys.each {|key| expect(response.fetch(key)).to be_truthy }
  end
end
