class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end


  def edit
  end


  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to Board.find(Card.find(@item.card_id).board_id), notice: 'Item was successfully created.'
      else
        render :new
      end
  end


  def update
      if @item.update(item_params)
        redirect_to @item, notice: 'Item was successfully updated.' 
      else
        render :edit
      end
  end
  


  def destroy
    @board = Board.find(Card.find(@item.card_id).board_id)
    @item.destroy
    redirect_to @board, notice: 'Item was successfully destroyed.' 
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :card_id)
    end
end
