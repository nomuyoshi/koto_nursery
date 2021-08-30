class CapacitiesController < ApplicationController
  def index
    @capacities = Capacity.where(nursery_code: params[:nurseries_code])
  end
end
