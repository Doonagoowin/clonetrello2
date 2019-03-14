class CardsController < ApplicationController
  before_action :set_board
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = @board.cards
  end

  def show
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
    if @board.cards.update(card_params)
      redirect_to cards_path
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

  def set_board
    @board = current_user.boards.find(params[:board_id])
  end

  def set_card
    @card = @board.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description, :comment, :board_id)
  end

end
