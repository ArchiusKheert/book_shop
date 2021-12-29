class ReviewsController < ApplicationController

  load_and_authorize_resource



  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = 'Review was uploaded. Waiting for admin checking'
    else
      flash[:danger] = @review.error.full_messages.join('. ').gsub('Text', 'Review')
    end

    redirect_back(fallback_location: root_path)
  end



  private

  def review_params
    params.require(:review).permit(:title, :text, :rating, :book_id, :user_id)
  end
end