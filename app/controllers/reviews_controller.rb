class ReviewsController < ApplicationController
  def index
    @university = University.find(params[:university_id])
    json_response(@university.reviews)
  end

  def create
  end

  def destroy
  end

  def update
  end

  def show
    json_response(Review.find(params[:id]))
  end
end
