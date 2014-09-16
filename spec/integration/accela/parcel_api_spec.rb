require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe Accela::ParcelAPI, :vcr do

  before(:each) do
    api = Accela::API.connection
    api.login("developer", "accela", "parcels")
  end

  describe "::get_all_parcels" do
    it "returns a list of Parcel objects" do
      parcels = Accela::ParcelAPI.get_all_parcels
      expect(parcels.length).to eq 25
    end
  end

  describe "::get_parcels" do
    it "returns a single Parcel object" do
      parcel = Accela::ParcelAPI.get_parcels("137200001")
      expect(parcel.parcel_number).to eq "137200001"
      expect(parcel.parcel_area).to eq 550800
    end
  end

end
