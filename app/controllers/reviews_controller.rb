class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = @user.id
    if @review.save
      render json: @review, status: :ok
    else
      render json: { message: @review.errors.messages }, status: 401
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      render json: {  message: "review is gone forever and never."}, status: :ok
    else
      render json: {  message: "Review could not be destroyed"}, status: 400
    end

  end

  private

  def review_params
    params.permit(:user_id,
                  :product_id,
                  :body,
                  :rate
                 )
  end

end
