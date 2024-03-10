class ListsController < ApplicationController
  before_action :set_list, only: %i[ show destroy create_review ]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @review = Review.new
    @reviews = @list.reviews
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create_review
    @review = Review.new(review_params)
    @review.list = @list

    if @review.save
      redirect_to list_path(@list), notice: "Review was successfully created."
    else
      render :show, status: :unprocessable_entity
    end
  end


  def destroy
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
