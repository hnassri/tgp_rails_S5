class HomeController < ApplicationController
  def index
    @user_by_name = params[:user_by_name]
  end

end
