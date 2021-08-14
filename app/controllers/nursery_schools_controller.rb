class NurserySchoolsController < ApplicationController
  # GET /nursery_schools
  def index
    @nursery_schools = NurserySchool.all

    render json: @nursery_schools
  end

  # GET /nursery_schools/1
  def show
    @nursery_school = NurserySchool.find(params[:id])
    render json: @nursery_school
  end
end
