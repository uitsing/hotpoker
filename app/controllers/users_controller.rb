class UsersController < ApplicationController
  before_action :set_user

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user
      session['uuid'] = user.uuid
      redirect_to rooms_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find_by(uuid: session['uuid'])
    redirect_to rooms_path if @user
  end
end
