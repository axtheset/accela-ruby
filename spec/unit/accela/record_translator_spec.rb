require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Accela::RecordTranslator do

  let(:translator) { Accela::RecordTranslator.new }

  describe "#json_to_ruby" do

    let(:input) {
      [
        {
          "balance" => 123.45,
          "assignedUser" => "Dale Cooper",
          "publicOwned" => false
        }
      ]
    }

    let(:result) { translator.json_to_ruby(input) }

    it "translates from a json hash to a ruby hash" do
      expected = [{
        balance: 123.45,
        assigned_user: "Dale Cooper",
        public_owned: false
      }]

      expect(result).to eq expected
    end

  end

  describe "#ruby_to_json" do

    let(:input) {
      [{
        balance: 123.45,
        assigned_user: "Dale Cooper",
        public_owned: false
      }]
    }

    let(:result) { translator.ruby_to_json(input) }

    it "translates from a json hash to a ruby hash" do
      expected = [{
        "balance" => 123.45,
        "assignedUser" => "Dale Cooper",
        "publicOwned" => false
      }]

      expect(result).to eq expected
    end

  end
end
