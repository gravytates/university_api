class ReviewsController < ApplicationController
  def index
    @university = University.find(params[:university_id])
    json_response(@university.reviews)
  end

  def create
    @university = University.find(params[:university_id])
    json_response(@university.reviews.create!(review_params), :created)
  end

  def destroy
  end

  def update
  end

  def show
    json_response(Review.find(params[:id]))
  end

private

  def review_params
    params.permit(:author, :content, :rating)
  end

end
