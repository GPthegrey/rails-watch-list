class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    if @review.save
      redirect_to list_path(@list), notice: "Review was successfully created."
    else
      logger.error @review.errors.full_messages.to_sentence
      render :show, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
