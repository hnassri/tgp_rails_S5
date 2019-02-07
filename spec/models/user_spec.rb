require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @city = City.create(name: "Paris")
    @user = User.create(first_name: "John", last_name: "Doe", age: 20, email: "blablabla@cool.fr", description: "helloooooooooo woooooooorld", city: @city)
  end

  context "associations" do

    describe "gossips" do
      it "should have many gossips" do
        gossip = Gossip.create(user: @user,title: "fnffd",content: "vvfevks b sdvss")
        expect(@user.gossips.include?(gossip)).to eq(true)
      end
    end

    describe "likes" do
      it "should have many likes" do
        like = Like.create(user: @user)
        expect(@user.likes.include?(like)).to eq(true)
      end
    end

  end
  

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end
    
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is not a valid attributes" do
      bad_user = User.create(first_name: "John", last_name: "Doe", age: 20, email: "blablabla@cool.fr",city: @city)
      expect(bad_user).not_to be_valid
      expect(bad_user.errors.include?(:description)).to eq(true)
    end

    it "is not a valid attributes" do
      bad_user = User.create(first_name: "John", last_name: "Doe", age: 20,city: @city, description: "ffenvk;nc;n fvnvvnf")
      expect(bad_user).not_to be_valid
      expect(bad_user.errors.include?(:email)).to eq(true)
    end

  end

end
