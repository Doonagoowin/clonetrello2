class CardsController < ApplicationController
  def index
    @cards = @board.cards
  end

  def show
    @card = @board.cards.find(params[:id])
  end
  
  def new
    @card = @board.cards.new
  end

  def create
    @card = @board.cards.new(card_params)

    if @board.cards.save
      redirect_to cards_path
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
    params.require(:card).permit(:title, :description, :comment)
  end

end
