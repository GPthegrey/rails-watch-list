class ListsController < ApplicationController
  before_action :set_list, only: %i[ show destroy]

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



  def destroy
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end


  def set_list
    @list = List.find(params[:id])
  end
end
