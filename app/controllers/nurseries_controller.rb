class NurseriesController < ApplicationController
  # GET /nurseries/1
  def show
    @nursery = Nursery.find(params[:id])
    render json: @nursery
  end

  # POST /nurseries
  def search
    begin
      @nurseries = Nursery.search(params[:kinds], params[:min_age_types], params[:address], params[:km])
    rescue Timeout::Error => e
      render json: { error: "timeout" }, status: :internal_server_error and return
   end

    render json: @nurseries
  end
end
