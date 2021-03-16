class ItemsController < ApplicationController
  before_action :set_user, :set_room
  before_action :set_item, only: %i[reveal restart show]

  def reveal
    @item.cards.each(&:reveal!)
  end

  def restart
    @item.cards.destroy_all
    redirect_to room_item_path(@room, @item)
  end

  def index
    @items = @room.items
    @new_item = @room.items.new
  end

  def show
    redirect_to room_path(@room) unless @item
  end

  def new
    @item = @room.items.new
  end

  def create
    item = @room.items.create(item_params)
    if item
      redirect_to room_item_path(@room, item)
    else
      render :new
    end
  end

  private

  def set_item
    @item = @room.items.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
