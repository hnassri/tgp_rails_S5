require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @like = Like.create
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@like).to be_a(Like)
    end
    
    it "is valid with valid attributes" do
      expect(@like).to be_valid
    end
  end
end
