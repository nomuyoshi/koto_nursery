class BorderlinesController < ApplicationController
  def index
    @borderlines_by_year = Borderline.where(nursery_code: params[:nurseries_code]).group_by(&:year)
  end
end
