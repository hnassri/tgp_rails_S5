require 'rails_helper'

RSpec.describe GossipController, type: :controller do

  describe "GET #gossip_page" do
    it "returns http success" do
      get :gossip_page
      expect(response).to have_http_status(:success)
    end
  end

end
