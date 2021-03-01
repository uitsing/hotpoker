class RoomsController < ApplicationController
  before_action :set_user

  def index
    @rooms = @user.rooms
    @public_rooms = Room.where(private: false)
  end

  def show
    @room = @user.rooms.find(params[:id])
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

  def set_user
    @user = User.find_by(uuid: session['uuid'])
    redirect_to new_user_path unless @user
  end
end
