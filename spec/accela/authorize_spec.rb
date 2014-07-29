require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

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

end
