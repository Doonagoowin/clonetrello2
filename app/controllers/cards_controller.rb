class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :delete]
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end
  
  def new
    @card = Card.new
  end

  def create
    @cards = Card.new(card_params)

    if @cards.save
      redirect_to Board.find(@cards.board_id)
    else
      render :new
    end
  end

  def update
    @card = @board.cards.find(params[:id])
  
    if @board.cards.update(card_params)
      redirect_to cards_path
    else
      render :edit
    end
  end

  def edit
    @card = @board.cards.find(params[:id])
  end

  def destroy
    @board.cards.find(params[:id]).destroy
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:name, :description, :comment, :board_id)
  end

  def set_card
    @card = Card.find(params[:id])
  end
  

end
