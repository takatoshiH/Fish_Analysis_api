class CitiesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
    @cities = @prefecture.cities
    render json: { status: 'SUCCESS', data: @cities }
  end
end
