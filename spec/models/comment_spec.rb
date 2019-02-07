require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create
    @gossip = Gossip.create
    @comment = Comment.create(content: "Paris", user: @user, gossip: @gossip)
  end

  context "validation" do
    
    it "is valid with valid attributes" do
      expect(@comment).to be_a(Comment)
    end

    it "is valid with valid attributes" do
      expect(@comment).to be_valid
    end

    
    it "is a bad private_message" do
      bad_pm = Comment.create
      expect(bad_pm).not_to be_valid
      expect(bad_pm.errors.include?(:content)).to eq(true)
    end
    
  end
end
