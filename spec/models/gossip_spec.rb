require 'rails_helper'

RSpec.describe Gossip, type: :model do
  before(:each) do
    @user = User.create(first_name: "John", last_name: "Doe", age: 20, email: "blablabla@cool.fr", description: "helloooooooooo woooooooorld", city: @city)
    @gossip = Gossip.create(title: "hell yeah", content: "ezrlqjgmregj", user: @user )
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@gossip).to be_a(Gossip)

    end
    
    it "is valid with valid attributes" do
      expect(@gossip).to be_valid
    end

    it "is not a valid attributes" do
      bad_gossip = Gossip.create(title: "f,zsd",user: @user)
      expect(bad_gossip).not_to be_valid
      expect(bad_gossip.errors.include?(:content)).to eq(true)
    end

    it "is not a valid attributes" do
      bad_gossip = Gossip.create(content: "f,zsdfzfss",user: @user)
      expect(bad_gossip).not_to be_valid
      expect(bad_gossip.errors.include?(:title)).to eq(true)
    end

  end
end
