class UniversitiesController < ApplicationController
  def index
    @universities = University.all
    json_response(@universities)
  end

  def show
    @university = University.find(params[:id])
    json_response(@university)
  end

  def create
    @university = University.create(university_params)
    json_response(@university)
  end

  def update
    @university = University.find(params[:id])
    @university.update(university_params)
  end

  def destroy
    @university = University.find(params[:id])
    @university.destroy
  end

  private

  def university_params
    params.permit(:name, :description, :population, :mascot)
  end
end
