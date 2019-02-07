class CityController < ApplicationController

  def show
    @city_id = City.find(params[:id])
  end

end
