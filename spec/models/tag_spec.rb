require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  before(:each) do
    @tag = Tag.create(title: "salut")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@tag).to be_a(Tag)
    end
    
    it "is valid with valid attributes" do
      expect(@tag).to be_valid
    end


    it "is a bad private_message" do
      bad_pm = Tag.create
      expect(bad_pm).not_to be_valid
      expect(bad_pm.errors.include?(:title)).to eq(true)
    end
  end
end
