class ItemsController < ApplicationController
  before_action :set_user
  before_action :set_room

  def index
    @items = @room.items
    @new_item = @room.items.new
  end

  def show
    @item = @room.items.find_by(id: params[:id])
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

  def item_params
    params.require(:item).permit(:name)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
