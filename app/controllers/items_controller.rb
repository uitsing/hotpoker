class ItemsController < ApplicationController
  before_action :set_room

  def index
    @items = @room.items
  end

  def show
    @item = @room.items.find(params[:id])
  end

  def new
    @item = @room.items.new
  end

  def create
    @item = @room.items.create(item_params)
    if @item
      redirect_to @item
    else
      render :new
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end
end
