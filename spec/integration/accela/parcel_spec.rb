require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::Parcel, :vcr do

  before(:each) do
    api = Accela::API.connection
    api.login("developer", "accela", "parcels")
  end

  describe "::all" do
    it "returns a list of Parcel objects" do
      parcels = Accela::Parcel.all
      expect(parcels.length).to eq 25
    end
  end

  describe "::find" do
    it "returns a single Parcel object" do
      parcel = Accela::Parcel.find("137200001")
      expect(parcel.parcel_number).to eq "137200001"
      expect(parcel.parcel_area).to eq 550800
    end
  end

end
