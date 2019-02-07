require 'rails_helper'

RSpec.describe City, type: :model do
  before(:each) do
    @city = City.create(name: "Paris",zip_code: "67500")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
    end
    
    it "is valid with valid attributes" do
      expect(@city).to be_valid
    end

    it "is bad city" do
      bad_city = City.create(name: "LA")
      expect(bad_city).not_to be_valid
      expect(bad_city.errors.include?(:zip_code)).to eq(true)
    end
  end
end
