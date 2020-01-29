class PrefecturesController < ApplicationController

  def index
    @prefectures = Prefecture.all
    render json: { status: 'SUCCESS', data: @prefectures }
  end
end
