class ListsController < ApplicationController
  before_action :set_card
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @list = @card.lists
  end

  def show
  end

  def edit
 #   render :index
  end

  def update
    if @list.update(list_params)
      redirect_to [@card, @list]
    else
      render :edit
    end
  end

  def create
    @list = @card.lists.new(list_params)
    if @list.save
      redirect_to [@card, @list]
    else
      render :new
    end
  end

  def new
    @list = @card.lists.new
  end

  def destroy
    @list.destroy
    redirect_to @index
  end

  private
  def set_card
    @card = @board.cards.find(params[:card_id])
  end

  def set_list
    @list = List.find(params[:id])
  end
  
  def topic_params
    params.require(:list).permit(:name)
  end
end
