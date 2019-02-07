require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index_user" do
    it "returns http success" do
      get :index_user
      expect(response).to have_http_status(:success)
    end
  end

end
