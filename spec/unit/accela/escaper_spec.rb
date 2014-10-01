require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Accela::Escaper do

  let(:escaper) {
    Object.new.extend(Accela::Escaper)
  }

  describe "#escape" do

    it "escapes URIs according to Accela's spec" do
      input = "ServiceRequest-Streets and Sidewalks-Snow Removal-NA"
      expected = "ServiceRequest.1Streets.cand.cSidewalks.1Snow.cRemoval.1NA"
      expect(escaper.escape(input)).to eq expected
    end

  end

end
