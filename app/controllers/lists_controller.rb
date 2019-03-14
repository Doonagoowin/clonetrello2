class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @list = List.all
  end

  def show
  end

  def edit
 #   render :index
  end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def destroy
    @list.destroy
    redirect_to @index
  end

  private
  def set_list
    @list = List.find(params[:id])
  end
  
  def list_params
    params.require(:list).permit(:name, :card_id)
  end
end
