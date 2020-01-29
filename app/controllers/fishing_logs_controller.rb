class FishingLogsController < ApplicationController
  protect_from_forgery

  def create
    params = JSON.parse(request.body.read)
    @fishing_log = FishingLog.create(started_date: params["started_date"], finished_date: params["finished_date"])
    render json: { status: 'SUCCESS', data: @fishing_log}
  end

end
