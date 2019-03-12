class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @list = @board.list
  end

  def show
  end

  def edit
 #   render :index
  end

  def update
    if @list.update(list_params)
      redirect_to [@board, @list]
    else
      render :edit
    end
  end

  def create
    @list = @board.list.new(list_params)
    if @list.save
      redirect_to [@board, @list]
    else
      render :new
    end
  end

  def new
    @list = @board.lists.new
  end

  def destroy
    @list.destroy
    redirect_to @index
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def set_list
    @list = List.find(params[:id])
  end
  
  def topic_params
    params.require(:list).permit(:name)
  end
end
