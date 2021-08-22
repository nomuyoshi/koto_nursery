class NurserySchoolsController < ApplicationController
  # GET /nursery_schools
  def index
    @nursery_schools = NurserySchool.search(params[:kinds], params[:min_age_types], params[:address], params[:km])

    render json: @nursery_schools
  end

  # GET /nursery_schools/1
  def show
    @nursery_school = NurserySchool.find(params[:id])
    render json: @nursery_school
  end
end
