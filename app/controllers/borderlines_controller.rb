class CapacitiesController < ApplicationController
  def index
    @borderlines = Borderline.where(nursery_code: params[:nurseries_code])
  end
end
