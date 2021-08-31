class NurseriesController < ApplicationController
  # GET /nurseries/1
  def show
    @nursery = Nursery.find(params[:code])
    render json: @nursery.as_json.transform_keys { |k| k.camelize(:lower) }
  end

  # POST /nurseries
  def search
    begin
      Rails.logger.debug("snakelize_params")
      Rails.logger.debug("#{snakelize_params[:kinds]}, #{snakelize_params[:min_age_type]}, #{snakelize_params[:address]}, #{snakelize_params[:km].to_f}")
      @nurseries = Nursery.includes(:capacities).
                     search(snakelize_params[:kinds], snakelize_params[:min_age_type], snakelize_params[:address], snakelize_params[:km].to_f).
                     order(:address)
    rescue Timeout::Error => e
      render json: { error: "timeout" }, status: :internal_server_error and return
    end

    render :index
  end
end
