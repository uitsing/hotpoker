class CardsController < ApplicationController
  before_action :set_user
  before_action :set_item

  def create
    card = @item.cards.find_by(user_id: @user.id)
    if card
      card.update(card_params)
    else
      @item.cards.create(card_params.merge(user_id: @user.id))
    end

  end

  private

  def card_params
    params.require(:card).permit(:point)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end