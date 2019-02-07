require 'rails_helper'

RSpec.describe PrivateMessage, type: :model do
  before(:each) do
    @pm = PrivateMessage.create(content: "aaaaaalllllllloooo")
  end

  context "validations" do

    it "is a bad private_message" do
      bad_pm = PrivateMessage.create
      expect(bad_pm).not_to be_valid
      expect(bad_pm.errors.include?(:content)).to eq(true)
    end

  end
end
