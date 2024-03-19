class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list

    respond_to do |format|
      if @review.save
        format.html { redirect_to list_path(@list) }
        format.json { render json: { inserted_item: render_to_string(partial: 'review', locals: { review: @review }), form: render_to_string(partial: 'lists/form', locals: { review: Review.new }) } }
      else
        format.html { render 'lists/form', status: :unprocessable_entity }
        format.json { render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
