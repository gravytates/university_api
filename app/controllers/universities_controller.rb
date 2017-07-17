class UniversitiesController < ApplicationController
  def index
    @universities = {"name": "USC", "description": "it's a great school.", "population": 15000, "mascot": "trojan"}
    json_response(@universities)
  end

  private
  def json_response(object)
    render json: object, status: 200
  end
end
