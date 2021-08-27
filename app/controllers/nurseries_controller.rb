class NurseriesController < ApplicationController
  # GET /nurseries
  def index
    @nurseries = Nursery.search(params[:kinds], params[:min_age_types], params[:address], params[:km])

    render json: @nurseries
  end

  # GET /nurseries/1
  def show
    @nursery = Nursery.find(params[:id])
    render json: @nursery
  end
end
