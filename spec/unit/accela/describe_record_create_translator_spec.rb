require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Accela::DescribeRecordCreateTranslator do

  let(:translator) { Accela::DescribeRecordCreateTranslator.new }

  describe "#json_to_ruby" do

    let(:input) {
      [
        {
           "fields"=> [
             {
               "name"=> "string",
               "isRequired"=> false
             }
           ],
           "elements"=> [
             {
               "name"=> "string",
               "isRequired"=> false,
               "isReference"=> false,
               "types"=> [
                 {
                   "value"=> "string",
                   "maxOccurance"=> 12345678,
                   "minOccurance"=> 12345678
                 }
               ]
             }
           ]
         }
      ]
    }

    let(:result) { translator.json_to_ruby(input) }

    it "translates from a json hash to a ruby hash" do
      expected = [{
        fields: [
             {
               name: "string",
               is_required: false
             }
           ],
           elements: [
             {
               name: "string",
               is_required: false,
               is_reference: false,
               types: [
                 {
                   value: "string",
                   max_occurance: 12345678,
                   min_occurance: 12345678
                 }
               ]
             }
           ]
      }]
      
      expect(result).to eq expected
    end

  end

end
