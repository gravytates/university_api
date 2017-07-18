class UniversitiesController < ApplicationController
  def index

    if params[:name]
      name = params[:name]
      @universities = University.search_by_name(name)
    elsif params[:description]
      description = params[:description]
      @universities = University.search_by_description(description)
    elsif params[:population]
      population = params[:population]
      @universities = University.search_by_population(population)
    elsif params[:mascot]
      mascot = params[:mascot]
      @universities = University.search_by_mascot(mascot)
    elsif params[:page]
      @universities = University.paginate(page: params[:page], per_page: 10)
    else
      @universities = University.all
    end

    json_response(@universities)
  end

  def show
    @university = University.find(params[:id])
    json_response(@university)
  end

  def create
    @university = University.create!(university_params)
    json_response(@university, :created)
  end

  def update
    @university = University.find(params[:id])
    @university.update(university_params)
    if @university.update!(university_params)
      render status: 200, json: { message: "Your university has successfully been updated." }
    end
  end

  def destroy
    @university = University.find(params[:id])
    @university.destroy
    if @university.destroy!
      render status: 200, json: { message: "Your university has successfully been deleted." }
    end
  end

  private

  def university_params
    params.permit(:name, :description, :population, :mascot)
  end
end
