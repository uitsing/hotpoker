class RoomsController < ApplicationController
  before_action :set_user

  def index
    @rooms = @user.rooms
    @public_rooms = Room.where(private: false)
  end

  def show
    @room = Room.find(params[:id])
    @item =
      if @room.items.empty?
        @room.items.create
      else
        @room.items.last
      end
    redirect_to room_item_path(@room, @item)
  end

  def new
    @room = @user.rooms.new
  end

  def create
    room = @user.rooms.create(room_params)
    if room
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :private)
  end
end
