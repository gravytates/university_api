class ReviewsController < ApplicationController
  # before_action :authenticate_request!, except: [:index, :show]

  def index
    @university = University.find(params[:university_id])
    json_response(@university.reviews)
  end

  def create
    @university = University.find(params[:university_id])
    json_response(@university.reviews.create!(review_params), :created)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    if @review.destroy!
      render status: 200, json: { message: "Your review has successfully been deleted." }
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    if @review.update!(review_params)
      render status: 200, json: { message: "Your review has successfully been updated." }
    end
  end

  def show
    json_response(Review.find(params[:id]))
  end

private

  def review_params
    params.permit(:author, :content, :rating)
  end

end
