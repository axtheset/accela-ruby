require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Accela::Configuration do

  describe "::app_id" do
    it "raises a ConfigurationError if it hasn't been set" do
      Accela::Configuration.app_id = nil
      expect {
        Accela::Configuration.app_id
      }.to raise_error(Accela::ConfigurationError)
    end
  end

  describe "::app_secret" do
    it "raises a ConfigurationError if it hasn't been set" do
      Accela::Configuration.app_secret = nil
      expect {
        Accela::Configuration.app_secret
      }.to raise_error(Accela::ConfigurationError)
    end
  end

  describe "::agency" do
    it "raises a ConfigurationError if it hasn't been set" do
      Accela::Configuration.agency = nil
      expect {
        Accela::Configuration.agency
      }.to raise_error(Accela::ConfigurationError)
    end
  end

  describe "::environment" do
    it "raises a ConfigurationError if it hasn't been set" do
      Accela::Configuration.environment = nil
      expect {
        Accela::Configuration.environment
      }.to raise_error(Accela::ConfigurationError)
    end
  end

end
