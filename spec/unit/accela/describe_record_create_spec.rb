require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe Accela::DescribeRecordCreate, :vcr do
  let(:input) { {
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
    }
  }

  let(:model) {
    Accela::DescribeRecordCreate.new input
  }

  it "exposes top level field properties" do
    expect(model.fields.first.name).to eq "string"
  end

  it "exposes top level element properties" do
    expect(model.elements.first.is_reference).to eq false
  end

  it "exposes element types" do
    expect(model.elements.first.types.first.value).to eq "string"
  end

end
